from django.db import models
from django.utils import timezone

# Create your models here.
class tbl_register(models.Model):
    name = models.CharField(max_length=100, default="")
    email = models.EmailField(max_length=100, default="")
    phn = models.CharField(max_length=100, default="")
    pswd = models.CharField(max_length=100, default="")
    # dob = models.CharField(max_length=100,default="")
    # gender = models.CharField(max_length=1, null=True, blank=True)
    place = models.CharField(max_length=100,default="")
    utype = models.CharField(max_length=100,default="user")
    
class tbl_doctor(models.Model):
    name = models.CharField(max_length=100, default="")
    email = models.EmailField(max_length=100, default="")
    phn = models.CharField(max_length=100, default="")
    pswd = models.CharField(max_length=100, default="")
    # gender = models.CharField(max_length=1, null=True, blank=True)
    place = models.CharField(max_length=100,default="")
    qualification = models.CharField(max_length=100, default="")
    exp = models.CharField(max_length=100, default="")
    specialization = models.CharField(max_length=100, default="")
    start_time = models.CharField(max_length=100, default="")
    end_time = models.CharField(max_length=100, default="")
    status = models.CharField(max_length=100, default="pending")
    utype = models.CharField(max_length=100,default="doctor")
    


class tbl_DoctorBooking(models.Model):
    user=models.ForeignKey(tbl_register,on_delete=models.CASCADE,blank=True,null=True)
    doctor=models.ForeignKey(tbl_doctor,on_delete=models.CASCADE,blank=True,null=True)
    date=models.CharField(max_length=100,default="")
    time= models.CharField(max_length=100,default="")
    created_at = models.CharField(max_length=100, default=timezone.now().strftime('%Y-%m-%d %H:%M:%S')) 
    status=models.CharField(max_length=100,default="")
    note_status=models.CharField(max_length=100,default="pending")
     
  
class tbl_usernote(models.Model):
    booking = models.ForeignKey(tbl_DoctorBooking, on_delete=models.CASCADE, blank=True, null=True)
    user = models.ForeignKey(tbl_register, on_delete=models.CASCADE, blank=True, null=True)
    note = models.TextField(default="")
    created_at = models.CharField(max_length=100, default=timezone.now().strftime('%Y-%m-%d %H:%M:%S')) 

class tbl_userrate(models.Model):
    user =models.ForeignKey(tbl_register, on_delete=models.CASCADE, blank=True, null=True)
    desc=models.TextField(default="")
    rating = models.CharField(max_length=100,default="")
    date = models.CharField(max_length=100,default="")
    

class tbl_emotion(models.Model):
    user_id=models.ForeignKey(tbl_register,on_delete=models.CASCADE,blank=True,null=True)
    emotion=models.CharField(max_length=100,default="")
    emotionfile=models.ImageField(upload_to='emotion',default='null.jpeg') 



class tbl_emotiondetection(models.Model):
    emotion=models.CharField(max_length=100,default="")
    emotionfile=models.ImageField(upload_to='emotion',default='null.jpeg') 
