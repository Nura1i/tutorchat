// To parse this JSON data, do
//
//     final serachUserData = serachUserDataFromJson(jsonString);

import 'dart:convert';

List<SerachUserData> serachUserDataFromJson(String str) =>
    List<SerachUserData>.from(
        json.decode(str).map((x) => SerachUserData.fromJson(x)));

String serachUserDataToJson(List<SerachUserData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SerachUserData {
  String id;
  String fullName;
  String userName;
  DateTime birthDate;
  String phone;
  String email;
  String status;
  String type;
  String image;

  SerachUserData({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.birthDate,
    required this.phone,
    required this.email,
    required this.status,
    required this.type,
    required this.image,
  });

  factory SerachUserData.fromJson(Map<String, dynamic> json) => SerachUserData(
        id: json["id"],
        fullName: json["fullName"],
        userName: json["userName"],
        birthDate: DateTime.parse(json["birth_date"]),
        phone: json["phone"],
        email: json["email"],
        status: json["status"],
        type: json["type"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "userName": userName,
        "birth_date":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "email": email,
        "status": status,
        "type": type,
        "image": image,
      };
}
