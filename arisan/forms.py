from django.forms import ModelForm, fields
from .models import Room
from django import forms

class RoomForm(ModelForm):

    user = forms.CharField(widget=forms.HiddenInput(attrs={
        'name':'user', 
    }))

    room_name = forms.CharField(widget=forms.TextInput(attrs={
        'name':'room_name', 
        'class':'form-control',
        'placeholder':'Room Name',
        'id': 'setting-input-3', 
        'required': True,
    }))

    max_member = forms.IntegerField(widget=forms.NumberInput(attrs={
        'name':'max_member', 
        'class':'form-control',
        'placeholder':'Max Member',
        'id': 'setting-input-3', 
        'required': True,
    }))

    min_member = forms.IntegerField(widget=forms.NumberInput(attrs={
        'name':'min_member', 
        'class':'form-control',
        'placeholder':'Min Member',
        'id': 'setting-input-3', 
        'required': True,
    }))

    cost = forms.IntegerField(widget=forms.NumberInput(attrs={
        'name':'cost', 
        'class':'form-control',
        'placeholder':'Cost',
        'id': 'setting-input-3', 
        'required': True,
    }))

    intervaldate = forms.IntegerField(widget=forms.NumberInput(attrs={
        'name':'intervaldate', 
        'class':'form-control',
        'placeholder':'Interval Date',
        'id': 'setting-input-3', 
        'required': True,
    }))

    started_at = forms.DateTimeField(widget=forms.DateTimeInput(attrs={
        'name':'date',
        'class': 'form-control',
        'placeholder': '%Y-%m-%d %H:%M:%S',
        'id': 'setting-input-3', 
        'required': True,
    }))

    class Meta:
        model = Room
        fields = ['id', 'room_name', 'max_member', 'min_member', 'cost', 'intervaldate', 'user', 'started_at']