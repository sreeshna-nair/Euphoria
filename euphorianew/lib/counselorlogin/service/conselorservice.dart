import 'dart:convert';
import 'dart:io';

import 'package:euphoria/UserLogin/Model/userloginmodel.dart';
import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/userRegModule/models/usermodel.dart';
import 'package:http/http.dart' as http;

Future<UserLoginModel> DoctorLogin({
  required String name,
  required String password,
}) async {
  try {
    Map param = {"email": name, "pswd": password, "utype": "doctor"};
    final resp = await http.post(
      Uri.parse(Urls.Login),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      //return resp.body;
      final response = UserLoginModel.fromJson(decoded);
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
