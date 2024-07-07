from django.contrib import admin
from django.urls import path,include
from.import views

urlpatterns = [
      path('',views.adminlogin,name='adminlogin'),
      path('admin_viewusers/',views.admin_viewusers,name='admin_viewusers'),
      path('admin_viewdoctors/',views.admin_viewdoctors,name='admin_viewdoctors'),
      path('admin_viewapproveddoctors/',views.admin_viewapproveddoctors,name='admin_viewapproveddoctors'),
      path('approve_doctor/<int:doctor_id>/', views.approve_doctor, name='approve_doctor'),
      path('reject_doctor/<int:doctor_id>/', views.reject_doctor, name='reject_doctor'),
      path('adminhome/',views.adminhome,name='adminhome'),
      path('login/',views.login),
      path('user_register/',views.user_register),
      path('doctor_register/',views.doctor_register),
      path('login/',views.login),
      path('view_available_doctors/',views.view_available_doctors),
      path('user_book_doctor/',views.user_book_doctor),
      path('doctor_view_bookings/',views.doctor_view_bookings),
      path('doctor_confirm_booking/',views.doctor_confirm_booking),
      path('doctor_reject_booking/',views.doctor_reject_booking),
      path('doctor_view_confirmed_bookings/',views.doctor_view_confirmed_bookings),
      path('user_view_bookings/',views.user_view_bookings),
      path('user_note/',views.user_note),
      path('user_addrating/',views.user_addrating),
      path('user_viewrating/',views.user_viewrating),
      path('checkemotion/',views.checkemotion),
      path('result_emotion/',views.result_emotion),
      path('search_notes_by_user/', views.search_notes_by_user, name='search_notes_by_user'),
       
]
