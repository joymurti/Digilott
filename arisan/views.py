from django.shortcuts import render, redirect
from .models import *
from .forms import RoomForm
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

import random, datetime

@login_required(login_url="loginPage")
# Create your views here.
def home(request):

    user = request.user

    current_rooms = user.room_set.all()

    available_rooms = Room.objects.all().exclude(user=user)

    context = {'current_rooms': current_rooms, 'available_rooms': available_rooms}

    return render(request, 'list_room.html', context)

@login_required(login_url="loginPage")
def createRoom(request):

    user = request.user

    form = RoomForm()
    if request.method == 'POST':
        form = RoomForm(request.POST)
        if form.is_valid():
            form.save()
            newRoom = Room.objects.filter(user=user).last()
            role = RoomRoles.objects.create(user=user, room=newRoom, role_room='host')
            role.save()
            return redirect(home)

    context = {'form':form}

    return render(request, 'add_room.html', context)

@login_required(login_url="loginPage")
def roomDetail(request, pk):
    detail = Room.objects.get(id=pk)
    member = detail.user.all()
    past_winner = Past_Winner.objects.filter(room=detail)
    count = member.count()

    role = detail.roomroles_set.get(user_id=request.user.id)
    role_name = role.role_room

    last_winner = past_winner.last()

    closed = 'FALSE'

    listpayment = Payment.objects.filter(room=detail)

    last_status = 'bill'

    if count < detail.min_member:
        context = {
            'detail': detail,
            'closed': closed,
            'count': count,
            'past_winner': past_winner,
            'status': last_status,
            'role': role_name,
            'winner': last_winner,
            'min': 'FALSE',
        }
    
    else:

        for payment in listpayment:
                payment = listpayment.exclude(status='paid')

                if payment.exists() and detail.finished_at is None:
                    last_status = 'bill'
                elif payment.exists():
                    last_status = 'pay'
                else:
                    last_status = 'paid'
        
        if detail.closed_at is not None:
            closed = 'TRUE'
            
            context = {
                'detail': detail,
                'closed': closed,
                'count': count,
                'past_winner': past_winner,
                'status': last_status,
                'role': role_name,
                'winner': last_winner,
                'min': 'TRUE',
            }

        else:
            context = {
                'detail': detail,
                'count': count,
                'past_winner': past_winner,
                'status': last_status,
                'role': role_name,
                'winner': last_winner,
                'min': 'TRUE',
            }


    return render(request, 'room.html', context)

@login_required(login_url="loginPage")
def roomEdit(request, pk):
    
    detail = Room.objects.get(id=pk)

    role = RoomRoles.objects.get(user=request.user, room=detail)

    if role.role_room == 'host':

        form = RoomForm(instance=detail)
        if request.method == 'POST':
            form = RoomForm(request.POST, instance=detail)
            if form.is_valid():
                form.save()
                return redirect(home)

        context = {
            'form': form,
        }


        return render(request, 'edit_room.html', context)
    
    return redirect(home)

@login_required(login_url="loginPage")
def roomDelete(request, pk):
    
    detail = Room.objects.get(id=pk)

    role = RoomRoles.objects.get(user=request.user, room=detail)

    if role.role_room == 'host':
        detail.delete()

        return redirect(home)
    
    return redirect(home)

@login_required(login_url="loginPage")
def payment(request, pk):

    detail = Room.objects.get(id=pk)

    if detail.finished_at is None:
        member = detail.user.all()

        for user in member:
            payment = Payment.objects.create(user=user, room=detail, amount=detail.cost, started_at=detail.started_at)
            payment.save()

    return redirect(roomDetail, pk=detail.id)

@login_required(login_url="loginPage")
def randomWinner(request, pk):
    detail = Room.objects.get(id=pk)
    member = detail.user.all()
    past_winner = Past_Winner.objects.filter(room=detail)
    count = member.count()
    closed = 'FALSE'
    
    if count == past_winner.count():
        closed = 'TRUE'

        context = {
            'detail': detail,
            'count': count,
            'past_winner': past_winner,
            'closed': closed,
        }

    else:
        for winner_user in past_winner:
            member = member.exclude(id=winner_user.user_id)

        winner = random.choice(member)

        context = {
            'detail': detail,
            'count': count,
            'past_winner': past_winner,
            'winner': winner,
            'closed': closed,
        }

    return render(request, 'room_winner.html', context)

@login_required(login_url="loginPage")
def pastWinner(request):

    if request.method == 'POST':
        if 'winner_id' in request.POST and 'detail_id' in request.POST:
            winner_id = request.POST['winner_id']
            detail_id = request.POST['detail_id']
            detail = Room.objects.get(id=detail_id) 
            member = detail.user.all()  
            count = member.count()
            detail.finished_at = detail.started_at = datetime.datetime.now().strftime('%Y-%m-%d-%H:%M:%S')
            winner_user = User.objects.get(id=winner_id)
            pw = Past_Winner.objects.create(user=winner_user, room=detail, amount=((detail.cost)*count), win_date = datetime.datetime.now().strftime('%Y-%m-%d-%H:%M:%S'))
            pw.save()
            detail.save()
            for user in member:
                payment = Payment.objects.create(user=user, room=detail, amount=detail.cost, started_at=detail.started_at)
                payment.save()

            return redirect(roomDetail, pk=detail_id)

@login_required(login_url="loginPage")
def closeRoom(request):

    if request.method == 'POST':
        if 'detail_id' in request.POST:
            detail_id = request.POST['detail_id']
            detail = Room.objects.get(id=detail_id)   
            detail.closed_at = datetime.datetime.now().strftime('%Y-%m-%d-%H:%M:%S')
            detail.finished_at = datetime.datetime.now().strftime('%Y-%m-%d-%H:%M:%S')
            detail.save()

            return redirect(roomDetail, pk=detail_id)

@login_required(login_url="loginPage")
def joinRoom(request, pk):

    detail = Room.objects.get(id=pk)
    member = detail.user.all()
    count = member.count()
    max = detail.max_member

    if max <= count:
        return redirect(home)

    user = request.user
    detail.user.add(user)
    role = RoomRoles.objects.create(user=user, room=detail, role_room='member')
    detail.save()
    role.save()

    return redirect(home)

@login_required(login_url="loginPage")
def myPayment(request):

    
    payment = Payment.objects.filter(user=request.user)

    context = {
        'payment': payment,
    }

    return render(request, 'payment.html', context)

@login_required(login_url="loginPage")
def paymentNow(request, pk):

    payment = Payment.objects.get(id=pk)
    payment.status = 'paid'
    payment.save()

    return redirect(myPayment)


            


        