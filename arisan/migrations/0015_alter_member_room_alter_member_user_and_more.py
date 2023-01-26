# Generated by Django 4.0 on 2021-12-30 18:49

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('arisan', '0014_alter_member_role_room_alter_payment_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='member',
            name='room',
            field=models.ManyToManyField(related_name='room_member', to='arisan.Room'),
        ),
        migrations.AlterField(
            model_name='member',
            name='user',
            field=models.ManyToManyField(related_name='user_member', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='past_winner',
            name='room',
            field=models.ManyToManyField(related_name='room_winner', to='arisan.Room'),
        ),
        migrations.AlterField(
            model_name='past_winner',
            name='user',
            field=models.ManyToManyField(related_name='user_winner', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='payment',
            name='room_id',
            field=models.ManyToManyField(related_name='room_payment', to='arisan.Room'),
        ),
    ]
