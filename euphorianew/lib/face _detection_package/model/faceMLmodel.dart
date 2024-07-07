import 'package:meta/meta.dart';
import 'dart:convert';

class FaceMlModel {
    List<Datum> data;

    FaceMlModel({
        required this.data,
    });

    FaceMlModel copyWith({
        List<Datum>? data,
    }) => 
        FaceMlModel(
            data: data ?? this.data,
        );

    factory FaceMlModel.fromRawJson(String str) => FaceMlModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FaceMlModel.fromJson(Map<String, dynamic> json) => FaceMlModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String emotionfile;
    String emotion;

    Datum({
        required this.emotionfile,
        required this.emotion,
    });

    Datum copyWith({
        String? emotionfile,
        String? emotion,
    }) => 
        Datum(
            emotionfile: emotionfile ?? this.emotionfile,
            emotion: emotion ?? this.emotion,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        emotionfile: json["emotionfile"],
        emotion: json["emotion"],
    );

    Map<String, dynamic> toJson() => {
        "emotionfile": emotionfile,
        "emotion": emotion,
    };
}
