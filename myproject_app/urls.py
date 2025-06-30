from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView

urlpatterns=[
    path("home",views.home, name="home"),
    path("",views.login_view,name="login"),
    path('', LogoutView.as_view(), name='logout'),
    path("createinvoice",views.createinvoice,name="createinvoice"),
    path("bills",views.bills,name="bills"),
    path("createbill",views.createbill,name="createbill"),
    path("invoices",views.invoices,name="invoices"),
    path("printinvoice/<int:invoiceid>/<str:invoicename>/",views.printinvoice,name="printinvoice"),
    path("printbill/<int:billid>/<str:billname>",views.printbill,name="printbill"),
    path('delete-invoice/<int:invoice_id>/', views.deleteinvoice, name='deleteinvoice'),
    path('delete-bill/<int:bill_id>/', views.deletebill, name='deletebill'),
    path("get-bill-details/", views.get_bill_details, name="get_bill_details"),
    path("forgotusername",views.forgotusername, name="forgotusername"),
    path("enterotp",views.enterotp, name="enterotp"),
    path("changelogin",views.changelogin, name="changelogin"),
    
]
