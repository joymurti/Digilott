from django.contrib import admin
from arisan.models import Room, RoomRoles, Past_Winner, Payment

# Register your models here.
class RoomAdmin(admin.ModelAdmin):
    list_display = ('room_name', 'created_at', 'started_at', 'min_member', 'max_member')

admin.site.register(Room, RoomAdmin)
admin.site.register(RoomRoles)
admin.site.register(Past_Winner)
admin.site.register(Payment)