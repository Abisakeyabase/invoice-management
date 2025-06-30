window.onload=function(){
    document.getElementById("download").addEventListener('click',()=>{
        const invoice=this.document.getElementById("billsec");
        console.log(invoice)
        console.log(window)
        var opt={
            filename:'mybill.pdf',
            image:{type:'jpeg',quality:1},
            html2canvas:{scale:1},
            jsPDF:{unit:'in',format:'a4',orientation:'portrait'}
        }
        html2pdf().from(invoice).set(opt).save()
    })

}

function printSection() {
    const printContent = document.getElementById("billsec").innerHTML;
    const originalContent = document.body.innerHTML;

    document.body.innerHTML = printContent; 
    window.print(); 
    document.body.innerHTML = originalContent; 
        }