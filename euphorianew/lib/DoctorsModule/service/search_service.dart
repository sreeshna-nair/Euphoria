
import 'dart:convert';
import 'dart:io';

import 'package:euphoria/DoctorsModule/module/search_model.dart';
import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/patientdetailentermodule/models/pt_details.dart';

import 'package:http/http.dart' as http;

Future<SearchListModel> search_user_service({

 required String userid,}) async {
  try {
    Map param = {
      "user_id": userid,
    
    };

    print(userid);
    final resp = await http.post(
      Uri.parse(Urls.search_notes_by_user),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = SearchListModel.fromJson(decoded);
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
