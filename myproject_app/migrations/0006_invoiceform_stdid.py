# Generated by Django 5.1.4 on 2025-01-30 09:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myproject_app', '0005_billform_billstdmobile'),
    ]

    operations = [
        migrations.AddField(
            model_name='invoiceform',
            name='stdid',
            field=models.PositiveIntegerField(default=1, unique=True),
        ),
    ]
