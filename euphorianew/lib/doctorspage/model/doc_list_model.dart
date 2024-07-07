import 'package:meta/meta.dart';
import 'dart:convert';

class DocListModel {
    List<Datum> data;

    DocListModel({
        required this.data,
    });

    DocListModel copyWith({
        List<Datum>? data,
    }) => 
        DocListModel(
            data: data ?? this.data,
        );

    factory DocListModel.fromRawJson(String str) => DocListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DocListModel.fromJson(Map<String, dynamic> json) => DocListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String email;
    String phn;
    String place;
    String qualification;
    String exp;
    String specialization;
    String startTime;
    String endTime;
    String status;

    Datum({
        required this.id,
        required this.name,
        required this.email,
        required this.phn,
        required this.place,
        required this.qualification,
        required this.exp,
        required this.specialization,
        required this.startTime,
        required this.endTime,
        required this.status,
    });

    Datum copyWith({
        int? id,
        String? name,
        String? email,
        String? phn,
        String? place,
        String? qualification,
        String? exp,
        String? specialization,
        String? startTime,
        String? endTime,
        String? status,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            phn: phn ?? this.phn,
            place: place ?? this.place,
            qualification: qualification ?? this.qualification,
            exp: exp ?? this.exp,
            specialization: specialization ?? this.specialization,
            startTime: startTime ?? this.startTime,
            endTime: endTime ?? this.endTime,
            status: status ?? this.status,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phn: json["phn"],
        place: json["place"],
        qualification: json["qualification"],
        exp: json["exp"],
        specialization: json["specialization"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phn": phn,
        "place": place,
        "qualification": qualification,
        "exp": exp,
        "specialization": specialization,
        "start_time": startTime,
        "end_time": endTime,
        "status": status,
    };
}
