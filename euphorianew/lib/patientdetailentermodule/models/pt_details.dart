import 'package:meta/meta.dart';
import 'dart:convert';

class UserNoteModel {
    String status;

    UserNoteModel({
        required this.status,
    });

    UserNoteModel copyWith({
        String? status,
    }) => 
        UserNoteModel(
            status: status ?? this.status,
        );

    factory UserNoteModel.fromRawJson(String str) => UserNoteModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserNoteModel.fromJson(Map<String, dynamic> json) => UserNoteModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
