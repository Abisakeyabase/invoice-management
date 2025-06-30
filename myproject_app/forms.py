from django import forms
from django.contrib.auth.forms import AuthenticationForm
from django.core.exceptions import ValidationError
import re

class CustomAuthenticationForm(AuthenticationForm):
    def clean_username(self):
        username = self.cleaned_data.get('username')
        if username and not re.match(r'^[a-zA-Z0-9_]+$', username): 
            raise ValidationError("Username can only contain letters, numbers, and underscores.")
        return username
