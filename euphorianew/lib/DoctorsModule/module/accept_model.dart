import 'package:meta/meta.dart';
import 'dart:convert';

class AcceptModel {
    String status;

    AcceptModel({
        required this.status,
    });

    AcceptModel copyWith({
        String? status,
    }) => 
        AcceptModel(
            status: status ?? this.status,
        );

    factory AcceptModel.fromRawJson(String str) => AcceptModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AcceptModel.fromJson(Map<String, dynamic> json) => AcceptModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
