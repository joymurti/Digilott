# Generated by Django 4.0.1 on 2022-01-07 04:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('arisan', '0025_alter_payment_unique_together'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='room',
            name='count',
        ),
    ]