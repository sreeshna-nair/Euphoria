# Generated by Django 4.1.4 on 2024-05-07 04:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('emotionapp', '0026_tbl_emotiondetection_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tbl_doctorbooking',
            name='created_at',
            field=models.CharField(default='2024-05-07 04:15:08', max_length=100),
        ),
        migrations.AlterField(
            model_name='tbl_usernote',
            name='created_at',
            field=models.CharField(default='2024-05-07 04:15:08', max_length=100),
        ),
    ]