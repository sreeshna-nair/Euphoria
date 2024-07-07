import 'package:meta/meta.dart';
import 'dart:convert';

class RejectModel {
    String status;

    RejectModel({
        required this.status,
    });

    RejectModel copyWith({
        String? status,
    }) => 
        RejectModel(
            status: status ?? this.status,
        );

    factory RejectModel.fromRawJson(String str) => RejectModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RejectModel.fromJson(Map<String, dynamic> json) => RejectModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
