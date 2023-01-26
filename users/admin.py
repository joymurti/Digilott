from django.contrib import admin
from users.models import UserProfile, Telepon

# Register your models here.
class TeleponAdmin(admin.ModelAdmin):
    list_display = ('user', 'telepon')

admin.site.register(UserProfile)
admin.site.register(Telepon, TeleponAdmin)