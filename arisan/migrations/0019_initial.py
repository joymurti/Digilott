# Generated by Django 4.0 on 2021-12-30 20:33

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('arisan', '0018_remove_past_winner_room_remove_past_winner_user_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('room_name', models.CharField(max_length=16, null=True)),
                ('max_member', models.IntegerField(null=True)),
                ('min_member', models.IntegerField(null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('started_at', models.DateField(blank=True, null=True)),
                ('finished_at', models.DateField(blank=True, null=True)),
                ('closed_at', models.DateTimeField(blank=True, null=True)),
                ('cost', models.IntegerField(null=True)),
                ('intervaldate', models.IntegerField(null=True)),
                ('user', models.ManyToManyField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='RoomRoles',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role_room', models.CharField(choices=[('host', 'host'), ('member', 'member')], default='member', max_length=16)),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='arisan.room')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='auth.user')),
            ],
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('started_at', models.DateField(blank=True, null=True)),
                ('finished_at', models.DateField(blank=True, null=True)),
                ('status', models.CharField(choices=[('paid', 'paid'), ('bill', 'bill')], default='bill', max_length=4)),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='arisan.room')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='auth.user')),
            ],
        ),
        migrations.CreateModel(
            name='Past_Winner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('win_date', models.DateTimeField(auto_now_add=True)),
                ('amount', models.IntegerField(null=True)),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='arisan.room')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='auth.user')),
            ],
        ),
    ]
