from django.db import models


class Invoiceform(models.Model):
     course_choice = [
        ('Python Full Stack', 'Python Full Stack'),
        ('Java Full Stack', 'Java Full Stack'),
        ('UI/UX Design', 'UI/UX Design'),
        ('Data Analytics', 'Data Analytics'),]
     stdid=models.PositiveIntegerField(unique=True)
     indate=models.DateField(unique=False,error_messages="err")
     sfname=models.CharField(max_length=50,unique=False)
     slname=models.CharField(max_length=50)
     pname=models.CharField(max_length=50)
     payment=models.CharField(max_length=50,default="Cash")
     pcnumber=models.CharField(max_length=12,unique=True)
     saddress=models.CharField(max_length=200,unique=False)
     email=models.EmailField(unique=True,max_length=50)
     coname=models.CharField(max_length=50,choices=course_choice,default='')
     coduration=models.CharField(max_length=20,unique=False)
     cototal=models.CharField(max_length=20,unique=False)
     coins1=models.CharField(max_length=20,unique=False)
     coins2=models.CharField(max_length=20,unique=False)
     coins3=models.CharField(max_length=20,unique=False)
     coinsdate1=models.DateField(unique=False)
     coinsdate2=models.DateField(unique=False)
     coinsdate3=models.DateField(unique=False)
     
     def save(self,*args,**kwargs):
        if not self.stdid:
           last_invoice=Invoiceform.objects.order_by('stdid').last()
           if last_invoice and last_invoice.stdid:
              self.stdid=last_invoice.stdid+1
           else:
              self.stdid=1
        super().save(*args,**kwargs)
        
     @staticmethod
     def create_with_custom_id(id, **kwargs):
        if Invoiceform.objects.filter(id=id).exists():
            raise ValueError(f"ID {id} is already in use")

        invoice = Invoiceform(id=id, **kwargs)
        invoice.save()
        return invoice
    
     class Meta:
        db_table="invoice_form"
     def __str__(self):
        return self.sfname

class Billform(models.Model):
     invoice = models.ForeignKey(Invoiceform, on_delete=models.CASCADE, related_name='bills',null=True,blank=True)
     course_choice = [
        ('Python Full Stack', 'Python Full Stack'),
        ('Java Full Stack', 'Java Full Stack'),
        ('UI/UX Design', 'UI/UX Design'),
        ('Data Analytics', 'Data Analytics'),]
     billnumber=models.CharField(max_length=20,unique=False)
     billstdmobile=models.CharField(max_length=20,unique=False,default=123,null=True,blank=True)
     billdate=models.DateField(unique=False)
     billstdname=models.CharField(max_length=50,unique=False)
     billconame=models.CharField(max_length=50,choices=course_choice,default='')
     billruppess=models.CharField(max_length=50)
     billamount=models.CharField(max_length=50)
     payment=models.CharField(max_length=50,default="Cash")
     is_paid = models.BooleanField(default=False)  # Track payment status

     
     class Meta:
        db_table="bill_form"
     def __str__(self):
        return self.billstdname
