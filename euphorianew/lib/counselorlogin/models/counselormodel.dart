// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    List<Datum> data;

    UserLoginModel({
        required this.data,
    });

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String status;
    String message;
    int id;
    String email;
    String name;
    String phone;
    String place;

    Datum({
        required this.status,
        required this.message,
        required this.id,
        required this.email,
        required this.name,
        required this.phone,
        required this.place,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
        message: json["message"],
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        place: json["place"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "place": place,
    };
}
