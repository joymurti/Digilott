# Generated by Django 4.0 on 2021-12-30 14:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        ('arisan', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Room',
            new_name='Rooms',
        ),
    ]