window.onload=function(){
    document.getElementById("download").addEventListener('click',()=>{
        const invoice=document.getElementById("invoice").innerHTML;
        console.log(invoice)
        console.log(window)
        setTimeout(() => {
            const opt = {
                margin: -5,
                filename: 'myinvoice.pdf',
                image: { type: 'jpeg', quality: 1 },
                html2canvas: { scale: 1, letterRendering: true },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait', compressPdf: true }
            };
        console.log(invoice)
        html2pdf().from(invoice).set(opt).save()
        },1000);
    })
}

const pdf = new jsPDF();
const content = document.getElementById("invoice");

html2canvas(content).then(canvas => {
    const imgData = canvas.toDataURL('image/jpeg');
    pdf.addImage(imgData, 'JPEG', 0, 0);
    pdf.save('invoice.pdf');
});

function printSection() {
    const printContent = document.getElementById("invoice").innerHTML;
    const originalContent = document.body.innerHTML;

    document.body.innerHTML = printContent; 
    window.print(); 
    document.body.innerHTML = originalContent;
}