console.log('dashboard script')
const activepage=window.location.pathname
console.log(activepage)
const navlink=document.querySelectorAll('a').forEach(link=>{
    if(link.href.includes(`${activepage}`)){
link.classList.add('active')
    }
})

document.getElementById("togle-btn").addEventListener('click',function(){
    const sidediv=document.getElementById("dash-sec")
    sidediv.style.display="block"
})
document.getElementById("togle-btn-cancel").addEventListener('click',function(){
    const sidediv1=document.getElementById("dash-sec")

    sidediv1.style.display="none"
})