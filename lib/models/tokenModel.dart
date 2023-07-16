// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  String status;
  String role;
  String token;

  TokenModel({
    required this.status,
    required this.role,
    required this.token,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        status: json["status"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "role": role,
        "token": token,
      };
}
