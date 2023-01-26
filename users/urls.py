from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.loginPage, name="loginPage"),
    path('register/', views.register, name="register"),
    path('logout/', views.logoutUser, name="logout"),
    path('profile/', views.userProfile, name="profile"),
    path('profile/edit', views.editProfile, name="edit_profile"),
    path('telepon/edit', views.editTelepon, name="edit_telepon"),
]