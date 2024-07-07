import 'dart:convert';
import 'dart:io';
import 'package:euphoria/constants/urls.dart';
import 'package:euphoria/face%20_detection_package/model/faceMLmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<FaceMlModel> FaceMLservice({required String imageTaken}) async {
  try {
    var uri = Uri.parse(Urls.checkemotion);
    http.Response response;
    final request = http.MultipartRequest(
      'POST',
      uri,
    );

    File? imageSource = (File(imageTaken));

    http.MultipartFile files;

    String fileName = imageSource.path.split("/").last;

    var stream = http.ByteStream(imageSource.openRead());

    var length = imageSource.path.isEmpty ? 0 : await imageSource.length();

    files = (http.MultipartFile('emotion', stream, length, filename: fileName));
    if (kDebugMode) {
      print(fileName);
    }

    request.files.add(files);

    if (kDebugMode) {
      print("Started uploading file");
    }

    var streamedResponse = await request.send();
    if (kDebugMode) {
      print(streamedResponse.statusCode);
    }
    response = await http.Response.fromStream(streamedResponse);
    final Map<String, dynamic> decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final response = FaceMlModel.fromJson(decoded);
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
