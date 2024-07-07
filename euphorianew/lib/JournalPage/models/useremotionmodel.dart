import 'package:meta/meta.dart';
import 'dart:convert';

class UserEmotionModel {
    List<Datum> data;

    UserEmotionModel({
        required this.data,
    });

    UserEmotionModel copyWith({
        List<Datum>? data,
    }) => 
        UserEmotionModel(
            data: data ?? this.data,
        );

    factory UserEmotionModel.fromRawJson(String str) => UserEmotionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserEmotionModel.fromJson(Map<String, dynamic> json) => UserEmotionModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    String desc;
    String rating;
    String date;

    Datum({
        required this.id,
        required this.userId,
        required this.desc,
        required this.rating,
        required this.date,
    });

    Datum copyWith({
        int? id,
        int? userId,
        String? desc,
        String? rating,
        String? date,
    }) => 
        Datum(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            desc: desc ?? this.desc,
            rating: rating ?? this.rating,
            date: date ?? this.date,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        desc: json["desc"],
        rating: json["rating"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "desc": desc,
        "rating": rating,
        "date": date,
    };
}
