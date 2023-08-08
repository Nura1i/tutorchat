// To parse this JSON data, do
//
//     final registerWphoneModel = registerWphoneModelFromJson(jsonString);

import 'dart:convert';

RegisterWphoneModel registerWphoneModelFromJson(String str) =>
    RegisterWphoneModel.fromJson(json.decode(str));

String registerWphoneModelToJson(RegisterWphoneModel data) =>
    json.encode(data.toJson());

class RegisterWphoneModel {
  String imageId;
  String username;
  String email;
  String password;
  String confirmPassword;
  String fullName;
  String birthDate;
  String address;
  String description;
  String telegramLink;
  String instagramLink;
  String facebookLink;
  String specialtyType;
  String genderType;

  RegisterWphoneModel({
    required this.imageId,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.fullName,
    required this.birthDate,
    required this.address,
    required this.description,
    required this.telegramLink,
    required this.instagramLink,
    required this.facebookLink,
    required this.specialtyType,
    required this.genderType,
  });

  factory RegisterWphoneModel.fromJson(Map<String, dynamic> json) =>
      RegisterWphoneModel(
        imageId: json["imageId"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        fullName: json["fullName "],
        birthDate: json["birth_date "],
        address: json["address "],
        description: json["description"],
        telegramLink: json["telegramLink"],
        instagramLink: json["instagramLink"],
        facebookLink: json["facebookLink"],
        specialtyType: json["specialtyType"],
        genderType: json["genderType"],
      );

  Map<String, dynamic> toJson() => {
        "imageId": imageId,
        "username": username,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "fullName ": fullName,
        "birth_date ": birthDate,
        "address ": address,
        "description": description,
        "telegramLink": telegramLink,
        "instagramLink": instagramLink,
        "facebookLink": facebookLink,
        "specialtyType": specialtyType,
        "genderType": genderType,
      };
}
