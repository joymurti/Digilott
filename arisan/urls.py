from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="arisan_home"),
    path('payment', views.myPayment, name="my_payment"),
    path('payment_now/<str:pk>', views.paymentNow, name="payment_now"),
    path('room/add', views.createRoom, name="create_room"),
    path('room/<str:pk>/winner', views.randomWinner, name="random"),
    path('room/<str:pk>/', views.roomDetail, name="room_detail"),
    path('room/<str:pk>/edit', views.roomEdit, name="room_edit"),
    path('room/<str:pk>/delete', views.roomDelete, name="room_delete"),
    path('room/<str:pk>/payment', views.payment, name="payment"),
    path('room/past_winner', views.pastWinner, name="past_winner"),
    path('room/close_room', views.closeRoom, name="close_room"),
    path('room/<str:pk>/join', views.joinRoom, name="join_room"),
]