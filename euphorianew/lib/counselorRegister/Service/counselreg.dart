import 'dart:convert';
import 'dart:io';

import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/userRegModule/models/usermodel.dart';
import 'package:http/http.dart' as http;

Future<uaerRegModel> DoctorReg(
    {required String username,
    required String email,
    required String phoneno,
    required String place,
    required String password,
    required String qualification,
    required String experience,
    required String specification,
    required String Starttime,
    required String Endtime}) async {
  try {
    Map param = {
      // "name": name,
      // "phn": phonenumber,
      "email": email,
      "pswd": password,
      "place": place,
      "name": username,
      "phn": phoneno,
      "qualification": qualification,
      "exp": experience,
      "specialization": specification,
      "start_time": Starttime,
      "end_time": Endtime
    };
    final resp = await http.post(
      Uri.parse(Urls.doctor_register),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      //return resp.body;
      final response = uaerRegModel.fromJson(decoded);
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
