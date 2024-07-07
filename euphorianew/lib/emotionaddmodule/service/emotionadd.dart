import 'dart:convert';
import 'dart:io';

import 'package:euphoria/UserLogin/Model/userloginmodel.dart';
import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/userRegModule/models/usermodel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<uaerRegModel> Emotionadd({
  required String description,
  required String rating,
  required String date,
}) async {
  try {
    Box? box1;
    box1 = await Hive.openBox('logindata');
    print(box1.get('id'));
    Map param = {
      "user_id": box1.get('id'),
      "desc": description,
      "rating": rating,
      "date": date
    };
    final resp = await http.post(
      Uri.parse(Urls.addemotion),
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
