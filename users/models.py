from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    nik = models.CharField(max_length=16, null=True)
    ktp = models.ImageField(null=True, blank=True)
    gol_pendapatan = models.IntegerField(null=True)
    provinsi = models.CharField(max_length=32, null=True)
    kota = models.CharField(max_length=32, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"

class Telepon(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    telepon = models.CharField(max_length=16, null=True)
    
    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.userprofile.save()