from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Room(models.Model):
    id = models.BigAutoField(primary_key=True)
    room_name = models.CharField(max_length=16, null=True)
    max_member = models.IntegerField(null=True)
    min_member = models.IntegerField(null=True)
    user = models.ManyToManyField(User)
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    started_at = models.DateTimeField(null=True, blank=True)
    finished_at = models.DateTimeField(null=True, blank=True)
    closed_at = models.DateTimeField(null=True, blank=True)
    cost = models.IntegerField(null=True)
    intervaldate = models.IntegerField(null=True)

    def __str__(self):
        return self.room_name

class RoomRoles(models.Model):
    ROLE = (
        ('host', 'host'),
        ('member', 'member'),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    role_room = models.CharField(max_length=16, default="member", choices=ROLE)

    class Meta:
        unique_together = [['user', 'room']]

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name} - {self.role_room}"


class Past_Winner(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    win_date = models.DateTimeField(auto_now_add=True)
    amount = models.IntegerField(null=True)

    class Meta:
        unique_together = [['user', 'room']]

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name} - {self.win_date} - {self.amount}"

class Payment(models.Model):
    STATUS = (
        ('paid', 'paid'),
        ('bill', 'bill'),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    started_at = models.DateTimeField(null=True, blank=True)
    finished_at = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=4, default="bill", choices=STATUS)
    amount = models.IntegerField(null=True)

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name} - {self.status}"
