from emotionapp. models import*
from rest_framework import serializers

class RegisterSerializer(serializers.ModelSerializer):
	class Meta:
		model=tbl_register
		fields='__all__'

class DoctorSerializer(serializers.ModelSerializer):
	class Meta:
		model=tbl_doctor
		fields='__all__'
  
class GetDoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_doctor
        fields = ['id', 'name', 'email', 'phn', 'place', 'qualification', 'exp', 'specialization', 'start_time', 'end_time','status']
        
class GetUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_register
        fields = ['id', 'name', 'email', 'phn', 'dob', 'place']
        
        
class DoctorBookingSerializer(serializers.ModelSerializer):
    user = RegisterSerializer()
    doctor = DoctorSerializer()

    class Meta:
        model = tbl_DoctorBooking
        fields = ['id', 'user', 'doctor', 'date', 'time', 'created_at', 'status']
        

class UserViewBookingSerializer(serializers.ModelSerializer):
    doctor_name = serializers.CharField(source='doctor.name')
    doctor_phn = serializers.CharField(source='doctor.phn')

    class Meta:
        model = tbl_DoctorBooking
        fields = ['id', 'doctor_name','doctor_phn', 'date', 'time', 'created_at', 'status']
        
class DoctorViewBookingSerializer(serializers.ModelSerializer):
    user_id = serializers.SerializerMethodField()
    user_name = serializers.SerializerMethodField()
    user_email = serializers.SerializerMethodField()
    user_place = serializers.SerializerMethodField()
    user_phn = serializers.SerializerMethodField()

    class Meta:
        model = tbl_DoctorBooking
        fields = ['id', 'user_id', 'user_name', 'user_email', 'user_place', 'user_phn', 'date', 'time', 'created_at', 'status']

    def get_user_name(self, obj):
        return obj.user.name if obj.user else None

    def get_user_email(self, obj):
        return obj.user.email if obj.user else None

    def get_user_place(self, obj):
        return obj.user.place if obj.user else None

    def get_user_phn(self, obj):
        return obj.user.phn if obj.user else None
    def get_user_id(self, obj):
        return obj.user.id if obj.user else None
        
        
class UserNoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_usernote
        fields = ['booking','user', 'note', 'created_at']  # Assuming you want to include all fields


class UserNoteSearchSerializer(serializers.ModelSerializer):
    user_name = serializers.CharField(source='user.name')
    user_email = serializers.EmailField(source='user.email')
    user_phn = serializers.CharField(source='user.phn')

    class Meta:
        model = tbl_usernote
        fields = ['id', 'user_name', 'user_email', 'user_phn', 'note', 'created_at']

class UserRateSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_userrate
        fields = ['id', 'user_id', 'desc', 'rating', 'date']


class EmotionSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_emotiondetection
        fields = [ 'emotionfile', 'emotion']