import 'package:meta/meta.dart';
import 'dart:convert';

class SearchListModel {
    List<Datum> data;

    SearchListModel({
        required this.data,
    });

    SearchListModel copyWith({
        List<Datum>? data,
    }) => 
        SearchListModel(
            data: data ?? this.data,
        );

    factory SearchListModel.fromRawJson(String str) => SearchListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchListModel.fromJson(Map<String, dynamic> json) => SearchListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String userName;
    String userEmail;
    String userPhn;
    String note;
    String createdAt;

    Datum({
        required this.id,
        required this.userName,
        required this.userEmail,
        required this.userPhn,
        required this.note,
        required this.createdAt,
    });

    Datum copyWith({
        int? id,
        String? userName,
        String? userEmail,
        String? userPhn,
        String? note,
        String? createdAt,
    }) => 
        Datum(
            id: id ?? this.id,
            userName: userName ?? this.userName,
            userEmail: userEmail ?? this.userEmail,
            userPhn: userPhn ?? this.userPhn,
            note: note ?? this.note,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhn: json["user_phn"],
        note: json["note"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "user_email": userEmail,
        "user_phn": userPhn,
        "note": note,
        "created_at": createdAt,
    };
}
