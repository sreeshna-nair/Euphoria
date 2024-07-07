import 'package:meta/meta.dart';
import 'dart:convert';

class UserBooklistModel {
    List<Datum> data;

    UserBooklistModel({
        required this.data,
    });

    UserBooklistModel copyWith({
        List<Datum>? data,
    }) => 
        UserBooklistModel(
            data: data ?? this.data,
        );

    factory UserBooklistModel.fromRawJson(String str) => UserBooklistModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserBooklistModel.fromJson(Map<String, dynamic> json) => UserBooklistModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String doctorName;
    String doctorPhn;
    String date;
    String time;
    String createdAt;
    String status;

    Datum({
        required this.id,
        required this.doctorName,
        required this.doctorPhn,
        required this.date,
        required this.time,
        required this.createdAt,
        required this.status,
    });

    Datum copyWith({
        int? id,
        String? doctorName,
        String? doctorPhn,
        String? date,
        String? time,
        String? createdAt,
        String? status,
    }) => 
        Datum(
            id: id ?? this.id,
            doctorName: doctorName ?? this.doctorName,
            doctorPhn: doctorPhn ?? this.doctorPhn,
            date: date ?? this.date,
            time: time ?? this.time,
            createdAt: createdAt ?? this.createdAt,
            status: status ?? this.status,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorName: json["doctor_name"],
        doctorPhn: json["doctor_phn"],
        date: json["date"],
        time: json["time"],
        createdAt: json["created_at"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_name": doctorName,
        "doctor_phn": doctorPhn,
        "date": date,
        "time": time,
        "created_at": createdAt,
        "status": status,
    };
}
