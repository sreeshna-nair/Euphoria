
import 'dart:convert';
import 'dart:io';

import 'package:euphoria/DoctorsModule/module/accept_model.dart';
import 'package:euphoria/DoctorsModule/module/reject_model.dart';
import 'package:euphoria/DoctorsModule/module/search_model.dart';
import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/patientdetailentermodule/models/pt_details.dart';

import 'package:http/http.dart' as http;

Future<RejectModel> reject_service({

 required String bookingid,}) async {
  try {
    Map param = {
      "booking_id": bookingid,
    
    };

    print(bookingid);
    final resp = await http.post(
      Uri.parse(Urls.doctor_reject_booking),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = RejectModel.fromJson(decoded);
      print(response);
      return response;
    
    } else {
      throw Exception('Failed to load response');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
