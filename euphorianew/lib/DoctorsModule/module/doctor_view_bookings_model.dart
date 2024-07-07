import 'package:meta/meta.dart';
import 'dart:convert';

class DocViewBookModel {
    List<Datum> data;

    DocViewBookModel({
        required this.data,
    });

    DocViewBookModel copyWith({
        List<Datum>? data,
    }) => 
        DocViewBookModel(
            data: data ?? this.data,
        );

    factory DocViewBookModel.fromRawJson(String str) => DocViewBookModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DocViewBookModel.fromJson(Map<String, dynamic> json) => DocViewBookModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    String userName;
    String userEmail;
    String userPlace;
    String userPhn;
    String date;
    String time;
    String createdAt;
    String status;

    Datum({
        required this.id,
        required this.userId,
        required this.userName,
        required this.userEmail,
        required this.userPlace,
        required this.userPhn,
        required this.date,
        required this.time,
        required this.createdAt,
        required this.status,
    });

    Datum copyWith({
        int? id,
        int? userId,
        String? userName,
        String? userEmail,
        String? userPlace,
        String? userPhn,
        String? date,
        String? time,
        String? createdAt,
        String? status,
    }) => 
        Datum(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            userName: userName ?? this.userName,
            userEmail: userEmail ?? this.userEmail,
            userPlace: userPlace ?? this.userPlace,
            userPhn: userPhn ?? this.userPhn,
            date: date ?? this.date,
            time: time ?? this.time,
            createdAt: createdAt ?? this.createdAt,
            status: status ?? this.status,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPlace: json["user_place"],
        userPhn: json["user_phn"],
        date: json["date"],
        time: json["time"],
        createdAt: json["created_at"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_place": userPlace,
        "user_phn": userPhn,
        "date": date,
        "time": time,
        "created_at": createdAt,
        "status": status,
    };
}
