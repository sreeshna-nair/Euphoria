import 'package:meta/meta.dart';
import 'dart:convert';

class DocBookModel {
    String status;

    DocBookModel({
        required this.status,
    });

    DocBookModel copyWith({
        String? status,
    }) => 
        DocBookModel(
            status: status ?? this.status,
        );

    factory DocBookModel.fromRawJson(String str) => DocBookModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DocBookModel.fromJson(Map<String, dynamic> json) => DocBookModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
