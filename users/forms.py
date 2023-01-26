from django.forms import ModelForm, widgets
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.http import request
from .models import *
from django.contrib.auth.models import User

class CreateUserForm(UserCreationForm):

    first_name = forms.CharField(widget=forms.TextInput(attrs={
        'name':'first_name', 
        'class':'form-control signup-name',
        'placeholder':'First Name',
        'required':True,
    }))

    last_name = forms.CharField(widget=forms.TextInput(attrs={
        'name':'first_name', 
        'class':'form-control signup-name',
        'placeholder':'Last Name',
        'required':True,
    }))

    username = forms.CharField(widget=forms.TextInput(attrs={
        'name':'Username', 
        'class':'form-control signup-name',
        'placeholder':'Username',
        'required':True,
    }))

    email = forms.EmailField(widget=forms.EmailInput(attrs={
        'name':'Email', 
        'class':'form-control signup-email',
        'placeholder':'Email',
        'required':True,
    }))

    password1 = forms.CharField(widget=forms.PasswordInput(attrs={
        'name':'first_name', 
        'class':'form-control signup-password',
        'placeholder':'Password',
        'required':True,
    }))

    password2 = forms.CharField(widget=forms.PasswordInput(attrs={
        'name':'first_name', 
        'class':'form-control signup-password',
        'placeholder':'Confirmation Password',
        'required':True,
    }))


    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password1', 'password2']

class EditProfile(ModelForm):
    class Meta:
        model = UserProfile
        fields = '__all__'
        exclude = ['user']

class EditTelepon(ModelForm):
    class Meta:
        model = Telepon
        fields = '__all__'