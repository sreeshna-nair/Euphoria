const String baseUrl = "http://192.168.57.70:8001/";

class Urls {
  static const String UserRegister = "${baseUrl}user_register/";
  static const String Login = "${baseUrl}login/";
  static const String doctor_register = "${baseUrl}doctor_register/";
  static const String doctorviewbookings = "${baseUrl}doctor_view_bookings/";
  static const String usernote = "${baseUrl}user_note/";
  static const String search_notes_by_user = "${baseUrl}search_notes_by_user/";
  static const String view_available_doctors =
      "${baseUrl}view_available_doctors/";
  static const String user_book_doctor = "${baseUrl}user_book_doctor/";
  static const String user_view_bookings = "${baseUrl}user_view_bookings/";
  static const String doctor_confirm_booking =
      "${baseUrl}doctor_confirm_booking/";
  static const String doctor_reject_booking =
      "${baseUrl}doctor_reject_booking/";
  static const String addemotion = "${baseUrl}user_addrating/";
  static const String viewuseremotion = "${baseUrl}user_viewrating/";
  static const String checkemotion = "${baseUrl}checkemotion/";
}
