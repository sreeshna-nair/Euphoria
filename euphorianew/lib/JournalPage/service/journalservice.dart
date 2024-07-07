import 'dart:convert';
import 'dart:io';
import 'package:euphoria/DoctorsModule/module/doctor_view_bookings_model.dart';
import 'package:euphoria/JournalPage/models/useremotionmodel.dart';
import 'package:euphoria/constants/urls.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<UserEmotionModel> viewjournal() async {
  Box? box1;
  box1 = await Hive.openBox('logindata');
  print(box1.get('id'));
  Map map = {
    "user_id": box1.get('id'),
  };

  try {
    final resp = await http.post(
      Uri.parse(Urls.viewuseremotion),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response =UserEmotionModel.fromJson(decoded);
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



