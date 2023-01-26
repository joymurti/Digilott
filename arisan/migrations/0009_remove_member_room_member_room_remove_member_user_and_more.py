# Generated by Django 4.0 on 2021-12-30 15:17

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('arisan', '0008_remove_member_room_member_room_remove_member_user_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='member',
            name='room',
        ),
        migrations.AddField(
            model_name='member',
            name='room',
            field=models.ManyToManyField(to='arisan.Room'),
        ),
        migrations.RemoveField(
            model_name='member',
            name='user',
        ),
        migrations.AddField(
            model_name='member',
            name='user',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
    ]