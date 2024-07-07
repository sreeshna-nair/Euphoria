import os
from django.shortcuts import render,redirect, HttpResponse
from.models import*
from .serializers import*
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from django.db.models import F
from django.http import HttpRequest, JsonResponse
from django.utils import timezone
from . emotion import*

def adminlogin(request):
    if request.method == "POST":
        pswd = request.POST.get('pswd')
        email = request.POST.get('email')
        user = tbl_register.objects.filter(pswd=pswd, email=email, utype='admin').first()
        if user:
            return render(request, "admin/admin_home.html")
        else:
            txt = """<script>alert("Invalid user Credentials....");window.location='/';</script>"""
            return HttpResponse(txt)
        
    return render(request, "login.html")

def adminhome(request):
    approved_users_count = tbl_register.objects.filter().count()
    approved_doctors_count = tbl_doctor.objects.filter(status='approved').count()
    context = {
        'users_count': approved_users_count,
        'doctors_count': approved_doctors_count,
    }
    return render(request, "admin/admin_home.html", context)

def admin_viewusers(request):
    data = tbl_register.objects.all().filter(utype="user")
    return render(request,'admin/admin_viewusers.html',{'data':data})

def admin_viewdoctors(request):
    data = tbl_doctor.objects.all().filter(status="pending")
    return render(request,'admin/admin_viewdoctors.html',{'data':data})

def admin_viewapproveddoctors(request):
    data = tbl_doctor.objects.all().filter(status="approved")
    return render(request,'admin/admin_viewapproveddoctors.html',{'data':data})


def approve_doctor(request, doctor_id):
    try:
        doctor = tbl_doctor.objects.get(id=doctor_id)
        doctor.status = 'approved'
        doctor.save()
        return redirect('admin_viewdoctors')
    except tbl_doctor.DoesNotExist:
        return HttpResponse("Doctor not found!")

def reject_doctor(request, doctor_id):
    try:
        doctor = tbl_doctor.objects.get(id=doctor_id)
        doctor.status = 'rejected'
        doctor.save()
        return redirect('admin_viewdoctors')
    except tbl_doctor.DoesNotExist:
        return HttpResponse("Doctor not found!")
    
@api_view(['POST'])
def user_register(request):
    if request.method == 'POST':  
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            response_data = {"status": "User registered successfully"}
            return Response(response_data, status=status.HTTP_200_OK)
    # If request is not valid or not POST, return error
    response_data = {"status": "Invalid request"}
    return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
    


@api_view(['POST'])
def doctor_register(request):
    serializer = DoctorSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        response_data = {"status": "Doctor registered successfully"}
        return Response(response_data, status=status.HTTP_200_OK)
    else:
        response_data = {"status": "error"}
        return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
    
# @api_view(['POST'])
# def login(request):
#     email = request.data.get('email')
#     pswd = request.data.get('pswd')
#     utype = request.data.get('utype')
#     try:
#         user = tbl_register.objects.filter(email=email, pswd=pswd,utype=utype)
#         doctor = tbl_doctor.objects.filter(email=email, pswd=pswd,utype=utype)

#         if user.exists():
#             user = user.first()
#             response_data = {
#                 "status": "success",
#                 "message": "Login successful",
#                 "id": user.id,
#                 "email": user.email,
#                 "name": user.name,
#                 "phone": user.phn,
#                 "place": user.place,

#             }
#         elif doctor.exists():
#             doctor = doctor.first()
#             response_data = {
#         "status": "success",
#         "message": "Login successful",
#         "id": doctor.id,
#         "email": doctor.email,
#         "name": doctor.name,
#         "phone": doctor.phn,
#         "place": doctor.place,
#         "qualification": doctor.qualification,
#         "exp": doctor.exp,
#         "specialization": doctor.specialization,
#         "start_time": doctor.start_time if doctor.start_time else None,
#         "end_time": doctor.end_time if doctor.end_time else None,
#         "status": doctor.status,
#         }

       
#         else:
#             response_data = {
#                 "status": "Failed",
#                 "message": "Invalid login credentials",
#             }
        
#         return Response({"data": [response_data]}, status=200)

#     except tbl_register.DoesNotExist:
#         response_data = {
#             "status": "error",
#             "message": "User does not exist",
#             "id": 0,
#             "username": "",
#             "email": "",
#             "name": "",
#             "phone": "",
#             "place": ""
#         }
#         return Response({"data": [response_data]}, status=400)






  
@api_view(['POST'])
def login(request):
    email = request.data.get('email')
    pswd = request.data.get('pswd')
    utype = request.data.get('utype')
    
    try:
        user = tbl_register.objects.get(email=email, pswd=pswd,utype=utype)
        response_data = {
            "status": "success",
            "message": "Login successful",
            "id": user.id,
            "email": user.email,
            "name": user.name,
            "phone": user.phn,
            "place": user.place if hasattr(user, 'place') else "",
        }
        return Response({"data": [response_data]}, status=status.HTTP_200_OK)

    except tbl_register.DoesNotExist:
        pass
    
    try:
        doctor = tbl_doctor.objects.get(email=email, pswd=pswd,utype=utype,status="approved")
        response_data = {
            "status": "success",
            "message": "Login successful",
            "id": doctor.id,
            "name": doctor.name,
            "email": doctor.email,
            "phone": doctor.phn,
            "place": doctor.place if hasattr(doctor, 'place') else "",
            "exp": doctor.exp if hasattr(doctor, 'exp') else "",
            "specialization": doctor.specialization,
            "start_time": doctor.start_time,
            "end_time": doctor.end_time,
        }
        return Response({"data": [response_data]}, status=status.HTTP_200_OK)

    except tbl_doctor.DoesNotExist:
        response_data = {
            "status": "Failed",
            "message": "Invalid login credentials",
        }
        return Response({"data": [response_data]}, status=status.HTTP_400_BAD_REQUEST)
    



@api_view(['GET'])
def view_doctor_profile(request):
    try:
        doctor_id = request.session.get('id')
        
        if doctor_id is None:
            return Response({"error": "Doctor ID not found in session"}, status=400)

        # Fetch the doctor's data based on the authenticated doctor's ID
        doctor = tbl_doctor.objects.get(id=doctor_id)
        serializer = GetDoctorSerializer(doctor)
        response_data = {"data": serializer.data}
        return Response(response_data)
    
    except tbl_doctor.DoesNotExist:
        raise NotFound("Doctor not found")

    except ObjectDoesNotExist:
        raise NotFound("Doctor not found")


@api_view(['GET'])
def view_user_profile(request):
    try:
        # Assuming you have some authentication mechanism in place 
        # to retrieve the currently authenticated user's ID
        user_id = request.session.get('user_id')  # Example: Retrieving user ID from session
        
        if user_id is None:
            return Response({"error": "User ID not found in session"}, status=400)
        # Fetch the user's data based on the authenticated user's ID
        user_profile = tbl_register.objects.get(id=user_id)
        
        serializer = GetUserSerializer(user_profile)
        response_data = serializer.data
        return Response(response_data)
    
    except tbl_register.DoesNotExist:
        raise NotFound("User profile not found")

    except ObjectDoesNotExist:
        raise NotFound("User profile not found")


@api_view(['GET'])
def view_available_doctors(request):
    available_doctors = tbl_doctor.objects.all().filter(status="approved")
    serializer = GetDoctorSerializer(available_doctors, many=True)
    return Response({'data': serializer.data})


@api_view(['POST'])
def user_book_doctor(request):
    user_id = request.data.get('user_id')
    doctor_id = request.data.get('doctor_id')
    date = request.data.get('date')
    time = request.data.get('time')

    try:
        doctor_booking = tbl_DoctorBooking.objects.create(
            user_id=user_id,
            doctor_id=doctor_id,
            date=date,
            time=time,
            status='pending'  # Assuming default status is 'pending'
        )
        # Don't need to serialize here if you only want to return a message
        return Response({"status": "Doctor booked successfully"}, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    
@api_view(['POST'])
def doctor_view_bookings(request):
    doctor_id = request.data.get('id')
    if doctor_id is not None:
        try:
            # Retrieve bookings for the specified doctor ID
            bookings = tbl_DoctorBooking.objects.filter(doctor_id=doctor_id,note_status="pending")
            
            # Serialize the bookings
            serializer = DoctorViewBookingSerializer(bookings, many=True)
            
            # Return serialized data
            response_data = {"data": serializer.data}
            return Response(response_data)
        except tbl_DoctorBooking.DoesNotExist:
            # Handle case where no bookings are found for the specified doctor ID
            response_data = {"error": "Doctor bookings not found"}
            return Response(response_data, status=404)
    else:
        # Handle case where no doctor ID is provided in the request data
        response_data = {"error": "No doctor ID provided"}
        return Response(response_data, status=400)



@api_view(['POST'])
def doctor_confirm_booking(request):
    booking_id = request.data.get('booking_id')
    if not booking_id:
        return Response({"error": "No booking ID provided"}, status=status.HTTP_400_BAD_REQUEST)
    try:
        booking = tbl_DoctorBooking.objects.get(id=booking_id)
        booking.status = "confirmed"
        booking.save()
        return Response({"status": "Booking confirmed successfully"}, status=status.HTTP_200_OK)
    except tbl_DoctorBooking.DoesNotExist:
        return Response({"error": "Booking not found"}, status=status.HTTP_404_NOT_FOUND)
    

   
from rest_framework.response import Response
@api_view(['POST'])
def doctor_reject_booking(request):
    booking_id = request.data.get('booking_id')
    if not booking_id:
        return Response({"error": "No booking ID provided"}, status=status.HTTP_400_BAD_REQUEST)

    try:
        booking = tbl_DoctorBooking.objects.get(id=booking_id)
        booking.delete()
        return Response({"status": "Booking deleted successfully"}, status=status.HTTP_200_OK)
    except tbl_DoctorBooking.DoesNotExist:
        return Response({"error": "Booking not found"}, status=status.HTTP_404_NOT_FOUND)

    

@api_view(['POST'])
def doctor_view_confirmed_bookings(request):
    id = request.data.get('id')
    if id is not None:
        try:
            bookings = tbl_DoctorBooking.objects.filter(doctor_id=id,status="confirmed")
            serializer = DoctorViewBookingSerializer(bookings, many=True)
            response_data = {"data": serializer.data}
            return Response(response_data)
        except tbl_DoctorBooking.DoesNotExist:
            response_data = {"error": "Doctor bookings not found"}
            return Response(response_data, status=404)
    else:
        response_data = {"error": "No doctor ID provided"}
        return Response(response_data, status=400)


@api_view(['POST'])
def user_view_bookings(request):
    user_id = request.data.get('user_id')  # Assuming user_id is used to identify the user
    if user_id is not None:
        try:
            bookings = tbl_DoctorBooking.objects.filter(user_id=user_id,status="confirmed")
            serializer = UserViewBookingSerializer(bookings, many=True)
            return Response({"data": serializer.data})
        except tbl_DoctorBooking.DoesNotExist:
            return Response({"error": "User bookings not found"}, status=404)
    else:
        return Response({"error": "No user ID provided"}, status=400)

@api_view(['POST'])
def user_note(request):
    user_id = request.data.get('user_id')
    booking_id = request.data.get('booking_id')
    print("Received user_id:", user_id)  # Debugging line
    print("Received booking_id:", booking_id)  # Debugging line
    
    if user_id is None:
        response_data = {"status": "Missing user_id in request data"}
        return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

    if booking_id is None:
        response_data = {"status": "Missing booking_id in request data"}
        return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'POST':  
        serializer = UserNoteSerializer(data=request.data)
        if serializer.is_valid():
            # Pass user_id and booking_id explicitly to the serializer during object creation
            user_note = serializer.save(user_id=user_id, booking_id=booking_id)
            
            # Update note_status of booking to "note added"
            try:
                booking_instance = tbl_DoctorBooking.objects.get(pk=booking_id)
                booking_instance.note_status = "note added"
                booking_instance.save()
            except tbl_DoctorBooking.DoesNotExist:
                print("Booking not found for booking_id:", booking_id)
                # Handle the case where the booking is not found
                
            response_data = {"status": "Note added successfully"}
            return Response(response_data, status=status.HTTP_200_OK)
        else:
            print("Serialization errors:", serializer.errors)  # Debugging line
            response_data = {"status": "Invalid request data"}
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)



@api_view(['POST'])
def search_notes_by_user(request):
    user_id = request.data.get('user_id')
    if not user_id:
        return Response({"error": "user_id parameter is missing"}, status=400)
    
    notes = tbl_usernote.objects.filter(user_id=user_id)
    serializer = UserNoteSearchSerializer(notes, many=True)
    
    return Response({"data": serializer.data}) 


# @api_view(['POST'])
# def get_doctor(request):
#     id = request.data.get('id') 
#     try:
#         # Fetch the doctor's data based on the provided ID
#         data = tbl_register.objects.get(id=id)
#         doctor = tbl_doctor.objects.filter(id=data.doctor_id).first()
#         if doctor:
#             serializer = getDoctorSerializer(doctor)
#             response_data = {"data": serializer.data}
#             return Response(response_data)
#         else:
#             response_data = {"error": "Doctor not found"}
#             return Response(response_data, status=404)
#     except ObjectDoesNotExist:
#         response_data = {"error": "Doctor not found"}
#         return Response(response_data, status=404)
    
    
@api_view(['POST'])
def user_addrating(request):
    user_id = request.data.get('user_id')
    
    if user_id is None:
        response_data = {"status": "Missing user_id in request data"}
        return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
    
    serializer = UserRateSerializer(data=request.data)
    if serializer.is_valid():     
        # Save the user rating along with the user_id
        serializer.save(user_id=user_id)
        response_data = {"status": "User rating added successfully"}
        return Response(response_data, status=status.HTTP_200_OK)  # Changed status code to 200 OK
    else:
        response_data = {"status": "Invalid request data"}
        return Response(response_data, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def user_viewrating(request):
    user_id = request.data.get('user_id')
    user_ratings = tbl_userrate.objects.filter(user_id=user_id)
    serializer = UserRateSerializer(user_ratings, many=True)
    response_data = {"data": serializer.data}
    return Response(response_data, status=status.HTTP_200_OK)



@api_view(['POST'])
def checkemotion(request):
    if request.method == 'POST':
        emotionfile = request.FILES.get('emotion')
        image_path = os.path.join('media', 'emotion', emotionfile.name)
        result = main(image_path)
        data = tbl_emotion(emotionfile=emotionfile)
        data.save()
        fake_request = HttpRequest()
        fake_request.method = 'GET'
        return result_emotion(fake_request)
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)


@api_view(['GET'])
def result_emotion(request):
    latest_entry = tbl_emotiondetection.objects.last()
    if latest_entry:
        serializer = EmotionSerializer(latest_entry)
        data = serializer.data
        if not data['emotion']:
            data['emotion'] = "No Emotion"
        response_data = {"data": [data]}  
        return Response(response_data)
    else:
        return Response({"error": "No data."}, status=400)






