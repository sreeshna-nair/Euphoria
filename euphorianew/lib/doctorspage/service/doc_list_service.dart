import 'dart:convert';
import 'dart:io';

import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/doctorspage/model/doc_list_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<DocListModel> doclistservice() async {
  try {
    final resp = await http.get(
      Uri.parse(Urls.view_available_doctors),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = DocListModel.fromJson(decoded);
      return response;
      //return resp.body
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
