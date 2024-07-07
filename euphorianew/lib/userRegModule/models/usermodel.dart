import 'dart:convert';

class uaerRegModel {
  final String status;

  uaerRegModel({
    required this.status,
  });

  factory uaerRegModel.fromRawJson(String str) => uaerRegModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory uaerRegModel.fromJson(Map<String, dynamic> json) => uaerRegModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}