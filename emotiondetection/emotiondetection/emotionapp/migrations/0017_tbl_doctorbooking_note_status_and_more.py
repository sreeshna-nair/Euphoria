# Generated by Django 4.1.4 on 2024-04-09 07:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('emotionapp', '0016_tbl_doctor_utype_tbl_register_utype_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='tbl_doctorbooking',
            name='note_status',
            field=models.CharField(default='pending', max_length=100),
        ),
        migrations.AlterField(
            model_name='tbl_doctorbooking',
            name='created_at',
            field=models.CharField(default='2024-04-09 07:00:19', max_length=100),
        ),
        migrations.AlterField(
            model_name='tbl_usernote',
            name='created_at',
            field=models.CharField(default='2024-04-09 07:00:19', max_length=100),
        ),
    ]