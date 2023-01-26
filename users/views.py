from django.shortcuts import render, redirect
from .forms import *

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required


from django.contrib import messages

# Create your views here.
def loginPage(request):
    if request.user.is_authenticated:
        return redirect('/arisan/')
    else:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')

            user = authenticate(request, username=username, password=password)

            if user is not None:
                login(request, user)
                return redirect('/arisan/')
            else:
                messages.info(request, 'Username Or Password is incorrect!')
                return redirect(loginPage)

    return render(request, 'login.html')

def register(request):
    
    if request.user.is_authenticated:
        return redirect('/arisan/')

    else:
        form = CreateUserForm()

        if request.method == 'POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                # messages.success(request, 'Account was created for ' + user)

                return redirect(loginPage)

    context = {'form': form}

    return render(request, 'register.html', context)

@login_required(login_url="loginPage")
def logoutUser(request):
    logout(request)

    return redirect(loginPage)

@login_required(login_url="loginPage")
def userProfile(request):
    user = request.user

    if user.userprofile is None or user.telepon_set.all() is None:
        context = {}
        return render(request, 'user_profile_empty.html', context)
    
    else:
        profile = user.userprofile

        telepon = user.telepon_set.all()

        print(telepon)

        context = {'profile': profile, 'telepon':telepon}

        return render(request, 'user_profile.html', context)

@login_required(login_url="loginPage")
def editProfile(request):
    user = request.user.userprofile
    form = EditProfile(instance=user)

    if request.method == 'POST':
        form = EditProfile(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect(userProfile)

    context = {
        'form':form
    }

    return render (request, 'edit_profile.html', context)

@login_required(login_url="loginPage")
def editTelepon(request):
    user = request.user
    form = EditTelepon()

    if request.method == 'POST':
        form = EditTelepon(request.POST)
        if form.is_valid():
            form.save()
            return redirect(userProfile)

    context = {
        'form':form
    }

    return render (request, 'edit_telepon.html', context)

    