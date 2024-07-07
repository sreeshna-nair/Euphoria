import 'dart:convert';
import 'dart:io';

import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/userRegModule/models/usermodel.dart';

import 'package:http/http.dart' as http;

Future<uaerRegModel> UserReg(
    {required String name,
    required String phonenumber,
    required String email,
    required String password,
    required String place}) async {
  try {
    Map param = {
      "name": name,
      "phn": phonenumber,
      "email": email,
      "pswd": password,
      "place": place
    };
    final resp = await http.post(
      Uri.parse(Urls.UserRegister),
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
