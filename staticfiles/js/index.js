console.log("index.js")
const userInput = document.getElementById('userinput');
const output = document.getElementById('output');

userInput.addEventListener('keyup', () => {
    const text = userInput.value;
    if (text.trim()) {
        output.innerHTML = `<h2>₹${text}</h2>`;
    } else {
        output.innerHTML = '';
    }
});
// -----------createinvoice-----
const courses=document.getElementById("courses")
const courseduration=document.getElementById("courseduration")
const gtotal = document.getElementById('output');

courses.addEventListener('change',()=>{
    if (courses.value==="Python Full Stack" || courses.value==="Java Full Stack" || courses.value==="UI/UX Design" || courses.value==="Data Analytics"){
        courseduration.value="6 months"
        userInput.value="36000"
        gtotal.innerHTML=36000
    }
    else{
        courseduration.value=""
        userInput.value=""
        gtotal.innerHTML=""
    }
   
})

// const ins1=document.getElementById("installment1")
// const ins2=document.getElementById("installment2")
// const ins3= document.getElementById("installment3")
// ins1.addEventListener('keyup',()=>{
//     ins1value=ins1.value
//     // console.log(ins1value)
//     if (ins1value !==""){
//         let totvalue=userInput.value
//         console.log("totalvalue",totvalue)
//         let installment1=ins1.value
//         console.log("installment",installment1)

//         let calculatedinstalment=totvalue-installment1
//         console.log("calculatedinstalment",calculatedinstalment)

//         let spredcalculatedinstalment=calculatedinstalment/2;
//         console.log("spredinstallment",spredcalculatedinstalment)

//         ins2.value=spredcalculatedinstalment.toFixed();
//         ins3.value =spredcalculatedinstalment.toFixed();
//         // console.log(ins2)

//        }
    
//     }
// )

document.getElementById("installment1").addEventListener("input", function () {
    let totalAmount = parseFloat(document.getElementById("userinput").value) || 0;
    let installment1 = parseFloat(this.value) || 0;
    let installment2 = parseFloat(document.getElementById("installment2").value) || 0;
    let installment3 = parseFloat(document.getElementById("installment3").value) || 0;

    let remaining = totalAmount - installment1;
    
    if (remaining < 0) {
        alert("Installment 1 cannot exceed total amount!");
        this.value = ""; // Reset input
    } else {
        document.getElementById("installment2").value = remaining / 2;
        document.getElementById("installment3").value = remaining / 2;
    }
});


document.addEventListener("DOMContentLoaded", function() {
    let today = new Date().toISOString().split('T')[0]; 
    document.getElementById("invoicedate").value = today;
    console.log(today,"autofill create invoice date")
});


const installmentdate1=document.getElementById("installmentdate1")
const installmentdate2=document.getElementById("installmentdate2")
const installmentdate3=document.getElementById("installmentdate3")
installmentdate1.addEventListener('change',()=>{
    const insdate1value = new Date(installmentdate1.value);
    const insdate2value = new Date(insdate1value);
    const insdate3value = new Date(insdate1value);
    insdate2value.setDate(insdate2value.getDate()+30)
    insdate3value.setDate(insdate3value.getDate()+60)
    installmentdate2.value=insdate2value.toISOString().split("T")[0]
    installmentdate3.value=insdate3value.toISOString().split("T")[0]
    console.log("First Installment Date:", insdate1value);
    console.log("Second Installment Date:", insdate2value);
    console.log("Third Installment Date:", insdate3value);
})

document.addEventListener('DOMContentLoaded',function(){
    const installmentdate1=document.getElementById("installmentdate1")
    const installmentdate2=document.getElementById("installmentdate2")
    const installmentdate3=document.getElementById("installmentdate3")    
    const today=new Date()    
        const insdate1value = new Date(today);
        const insdate2value = new Date(today);
        const insdate3value = new Date(today);

        insdate2value.setDate(insdate2value.getDate()+30)
        insdate3value.setDate(insdate3value.getDate()+60)
        
        installmentdate1.value=insdate1value.toISOString().split("T")[0]
        installmentdate2.value=insdate2value.toISOString().split("T")[0]
        installmentdate3.value=insdate3value.toISOString().split("T")[0]
        console.log(insdate1value)
})





// -------------------validations create invoice--------------------
document.getElementById("createinvoiceformid").addEventListener("submit", function (event) {
    document.querySelectorAll(".error-message").forEach(el => el.remove());

    let isValid = true;
    let totalAmount = parseFloat(document.getElementById("userinput").value) || 0;
    let installment1 = parseFloat(document.getElementById("installment1").value) || 0;
    let installment2 = parseFloat(document.getElementById("installment2").value) || 0;
    let installment3 = parseFloat(document.getElementById("installment3").value) || 0;

    function showError(inputId, message) {
        let inputField = document.getElementById(inputId);
        let errorSpan = document.createElement("span");
        errorSpan.className = "error-message";
        errorSpan.style.color = "red";
        errorSpan.style.fontSize = "14px";
        errorSpan.innerText = message;
        inputField.parentNode.appendChild(errorSpan);
        isValid = false;
    }

    let stdfname = document.getElementById("stdfname").value;
    if (!/^[A-Za-z\s]+$/.test(stdfname)) {
        showError("stdfname", "Only letters are allowed.");
    }

    let stdlname = document.getElementById("stdlname").value;
    if (!/^[A-Za-z\s]+$/.test(stdlname)) {
        showError("stdlname", "Only letters are allowed.");
    }

    let pname = document.getElementById("parentname").value;
    if (!/^[A-Za-z\s]+$/.test(pname)) {
        showError("parentname", "Only letters are allowed.");
    }

    // Validate Parent Contact Number
    let parnumber = document.getElementById("parnumber").value;
    if (!/^\d{10}$/.test(parnumber)) {
        showError("parnumber", "Enter a valid 10-digit number.");
    }
    let email = document.getElementById("email").value;
    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        showError("email", "Invalid email format.");
    }

    let numericFields = ["totalamount", "installment1", "installment2", "installment3"];
    numericFields.forEach(field => {
        let value = document.getElementById(field).value;
        if (value && isNaN(value)) {
            showError(field, "Must be a valid number.");
        }
    });
    let totalInstallments = installment1 + installment2 + installment3;
    if (totalInstallments > totalAmount) {
        showError("installment1","The sum of installments cannot be greater than the total amount.");
    }
    if (!isValid) {
        event.preventDefault();
    }
});


document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("createinvoiceformid").addEventListener("submit", function(event) {
        let errors = document.querySelectorAll(".error-message");
        if (errors.length > 0) {
            event.preventDefault();  // Stop form from clearing
        }
    });
});



