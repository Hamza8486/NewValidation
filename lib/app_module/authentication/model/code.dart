// To parse this JSON data, do
//
//     final getCode = getCodeFromJson(jsonString);

import 'dart:convert';

GetCode getCodeFromJson(String str) => GetCode.fromJson(json.decode(str));

String getCodeToJson(GetCode data) => json.encode(data.toJson());

class GetCode {
  GetCode({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory GetCode.fromJson(Map<String, dynamic> json) => GetCode(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
