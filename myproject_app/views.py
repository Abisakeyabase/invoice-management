from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import logout,login,authenticate
from django.contrib.auth.forms import AuthenticationForm
from .models import Invoiceform,Billform
from django.http import HttpResponse
from django.db.models import Sum
# from django.contrib.auth.decorators import login_required
from django.urls import reverse
from num2words import num2words
from .forms import CustomAuthenticationForm  # Import the custom form

from django.contrib.auth.models import User
import random
from django.core.mail import send_mail
from django.contrib import messages
from django.conf import settings



# @login_required
def logout_view(request):
    logout(request)
    messages.success(request, "Logged out successfully!")
    return redirect('login')

def home(request):
    total_row_invoice=Invoiceform.objects.all().count()

    invoicedetails = Invoiceform.objects.all().order_by('-id')[:6]
    total_row_bill=Billform.objects.all().count()
    total_sales=Invoiceform.objects.aggregate(Sum('cototal'))['cototal__sum'] or 0
    total_sales=int(total_sales)
    total_bill=Billform.objects.aggregate(Sum('billamount'))['billamount__sum'] or 0
    dueamount=total_sales-total_bill
    dueamount=int(dueamount)
    calculate_pendingbill=total_row_invoice*3
    pendingbills=calculate_pendingbill-total_row_bill
    return render(request, 'yabaseapp/home.html', {'invoicedetails': invoicedetails,'total_sales':total_sales,'total_row_invoice':total_row_invoice,'total_row_bill':total_row_bill,'dueamount':dueamount,'pendingbills':pendingbills})


def bills(request):
    billsdetails = Billform.objects.all()[::-1]
    return render(request, 'yabaseapp/bills.html', {'billsdetails':billsdetails })

def invoices(request):
    invoicedetails = Invoiceform.objects.all()[::-1]
    return render(request, 'yabaseapp/invoices.html', {'invoicedetails': invoicedetails})


def printbill(request,billid,billname):
    printbill=Billform.objects.get(id=billid,billstdname=billname)
    return render(request,'yabaseapp/printbill.html',{'printbill':printbill})


def printinvoice(request, invoiceid, invoicename):
    try:
      
        printinvoice = Invoiceform.objects.get(stdid=invoiceid, sfname=invoicename)
        total_bills = printinvoice.bills.count()
        remaining_bills=total_bills-3
        
        cototal = int(printinvoice.cototal)
        total_amount_paid = Billform.objects.filter(invoice=printinvoice).aggregate(Sum('billamount'))['billamount__sum'] or 0

        due_amount = cototal - total_amount_paid
        total_amount=cototal
        return render(request, 'yabaseapp/printinvoice.html', {'remain_bill':abs(remaining_bills),'total_bill':total_bills,'printinvoice': printinvoice,'total_amount_paid': int(total_amount_paid),'due_amount': int(due_amount),'total_amount':total_amount})
    except Invoiceform.DoesNotExist:
        messages.error(request, "Invoice not found.")
        return redirect('invoices')
    



def login_view(request):
    if request.method == "POST":
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)

            if user is not None:
                login(request, user)
                return redirect('home')  
            else:
                messages.error(request, "Invalid username or password") 

        else:
            messages.error(request, "Invalid username or password")  

        return render(request, 'yabaseapp/login.html', {'form': form})

    else:
        form = CustomAuthenticationForm()
        return render(request, 'yabaseapp/login.html', {'form': form})


from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Invoiceform  

def createinvoice(request):
    if request.method == "POST":
        errors = {}
        stdfname = request.POST.get("stdfname", "").strip()
        stdlname = request.POST.get("stdlname", "").strip()
        parentname = request.POST.get("parentname", "").strip()
        parnumber = request.POST.get("parnumber", "").strip()
        stdaddress = request.POST.get("stdaddress", "").strip()
        email = request.POST.get("email", "").strip()
        courses = request.POST.get("courses", "").strip()
        coduration = request.POST.get("coduration", "").strip()
        totalamount = request.POST.get("totalamount", "").strip()

        invoice_date = request.POST.get("invoicedate", "").strip()
        installment1 = request.POST.get("installment1", "0").strip()
        installment2 = request.POST.get("installment2", "0").strip()
        installment3 = request.POST.get("installment3", "0").strip()

        installmentdate1 = request.POST.get("installmentdate1", "").strip()
        installmentdate2 = request.POST.get("installmentdate2", "").strip()
        installmentdate3 = request.POST.get("installmentdate3", "").strip()

        try:
            totalamount = int(totalamount)
            installment1 = int(installment1) if installment1.isdigit() else 0
            installment2 = int(installment2) if installment2.isdigit() else 0
            installment3 = int(installment3) if installment3.isdigit() else 0
        except ValueError:
            errors["totalamount"] = "Invalid amount. Please enter a valid number."

        # Validation checks
        if not stdfname:
            errors["stdfname"] = "First name is required."
        if not email:
            errors["email"] = "Email is required."
        if not courses:
            errors["courses"] = "Course selection is required."
        if not isinstance(totalamount, int) or totalamount <= 0:
            errors["totalamount"] = "Total amount must be a positive number."
        if not parentname.isalpha():
            errors["parentname"] = "Only letters are allowed."
        if not parnumber.isdigit() or len(parnumber) != 10:
            errors["parnumber"] = "Enter a valid 10-digit number."
        if installment1 == 0 and installment2 == 0 and installment3 == 0:
            errors["installments"] = "At least one installment amount is required."

        total_installments = installment1 + installment2 + installment3
        if total_installments > totalamount:
            errors["installments"] = "Installment amount greater then total amount "

        if errors:
            return render(request, "yabaseapp/createinvoice.html", {
                "errors": errors,
                "form_data": request.POST, 
            })
        try:
            invoice = Invoiceform.objects.create(
                sfname=stdfname,
                slname=stdlname,
                pname=parentname,
                pcnumber=parnumber,
                saddress=stdaddress,
                email=email,
                coname=courses,
                coduration=coduration,
                cototal=totalamount,
                indate=invoice_date,
                coins1=installment1,
                coinsdate1=installmentdate1,
                coins2=installment2,
                coinsdate2=installmentdate2,
                coins3=installment3,
                coinsdate3=installmentdate3,
            )
            invoice.save()  

            messages.success(request, "Invoice created successfully.")
            return redirect("home")  
        except Exception as e:
            messages.error(request, f"Error: creating invoice: {e}")
            return render(request, "yabaseapp/createinvoice.html", {
                "errors": errors,
                "form_data": request.POST,
            })

    return render(request, "yabaseapp/createinvoice.html")




def createbill(request):
    if request.method=='POST':
        try:
            billnum=request.POST.get('billnumber')
            billmobilenumber=request.POST.get('mobile_number')
            billdate=request.POST.get('billdate')
            billstdname=request.POST.get('billstdname')
            billcourse=request.POST.get('courses')
            billrp=request.POST.get('billamountwords')
            billamount=request.POST.get('billamountnumbers')

            related_invoice = Invoiceform.objects.filter(sfname=billstdname,stdid=billnum).first()
            if related_invoice:
                billdetails=Billform(invoice=related_invoice,billnumber=billnum,billdate=billdate,billstdmobile=billmobilenumber,billstdname=billstdname,billconame=billcourse,billruppess=billrp,billamount=billamount)
                billdetails.save()
                messages.success(request,'Bill created successfully')
                return redirect('printbill', billid=billdetails.id, billname=billdetails.billstdname)

            else:
                messages.error(request,'Name or Id value miss matched')
                return redirect('createbill')
        except Exception as e:
            messages.error(request, f"Error during insert bill: {str(e)}")
            return redirect('createbill')
    return render(request, 'yabaseapp/createbill.html')


from django.shortcuts import redirect, get_object_or_404
def deleteinvoice(request, invoice_id):
    invoice = get_object_or_404(Invoiceform, stdid=invoice_id)
    invoice.delete()
    messages.success(request, f"Invoice {invoice_id} has been deleted successfully.")
    return redirect('invoices') 

def deletebill(request, bill_id):
    bill = get_object_or_404(Billform, id=bill_id)
    bill.delete()
    messages.success(request, f"Bill has been deleted successfully.")
    return redirect('bills') 


from django.http import JsonResponse

def get_bill_details(request):
    if request.method == "GET":
        name = request.GET.get("name")
        mobile_number = request.GET.get("mobile_number")
        try:
            bill = Invoiceform.objects.get(sfname=name, pcnumber=mobile_number)
            total_bill = bill.bills.count()
            
            amount1_words = num2words(bill.coins1, lang='en') if bill.coins1 else "zero"
            amount2_words = num2words(bill.coins2, lang='en') if bill.coins2 else "zero"
            amount3_words = num2words(bill.coins3, lang='en') if bill.coins3 else "zero"

            
            data = {
                "billnumber": bill.stdid,
                "billconame": bill.coname,
                "billstdname": bill.sfname,
                "coins1":bill.coins1,
                "coins2":bill.coins2,
                "coins3":bill.coins3,
                "coinsdate1":bill.coinsdate1,
                "coinsdate2":bill.coinsdate2,
                "coinsdate3":bill.coinsdate3,
                "totalbill":total_bill,
                "coins1_words": amount1_words,
                "coins2_words": amount2_words,
                "coins3_words": amount3_words
            }
            return JsonResponse(data, status=200)

        except Invoiceform.DoesNotExist:
            return JsonResponse({"error": "No matching bill found"}, status=404)
    return JsonResponse({"error": "Invalid request"}, status=400)





def forgotusername(request):
    if request.method == "POST":
        username = request.POST.get("username")
        try:
            user = User.objects.get(username=username)
            email = getattr(settings, 'EMAIL_HOST_USER', None)
            if user:
                   otp=random.randint(100000,999999)
                   request.session['otp']=otp
                   request.session['email']=email
                   subject = "Your OTP Code"
                   message = f"Your One-Time Password (OTP) is {otp}. Please use it to complete your verification."
                   from_email = 'your-email@gmail.com'
                   recipient_list = [email]
                   send_mail(subject, message, from_email, recipient_list)
                   return redirect('enterotp')
            else:
                error_message = "Invalid username"
        except User.DoesNotExist:
            error_message = "Username does not exist."
        
        return render(request, 'yabaseapp/forgotusername.html', {"error_message": error_message})
    return render(request, 'yabaseapp/forgotusername.html')


from django.shortcuts import render, redirect

def enterotp(request):
    error_message = None  # Initialize error_message to avoid reference errors
    if request.method == "POST":
        try:
            entered_otp = request.POST.get("otp")
            saved_otp = request.session.get('otp')

            if saved_otp and str(entered_otp) == str(saved_otp):
                del request.session['otp']
                del request.session['email']
                return redirect('changelogin')
            else:
                error_message = "Invalid OTP"
        except Exception as e:
            error_message = str(e)

    return render(request, 'yabaseapp/enterotp.html', {"error_message": error_message})
   

from django.contrib.auth.decorators import login_required
@login_required
def changelogin(request):
    if request.method == "POST":
        try:
            username = request.POST.get('changeusername')
            password = request.POST.get('changepassword')
            user = request.user  

            user.username = username 
            user.set_password(password)  
            user.save()

            return redirect('home')
        except Exception as e:
            return render(request, 'yabaseapp/changelogin.html', {"error_message": str(e)})

    return render(request, 'yabaseapp/changelogin.html')

