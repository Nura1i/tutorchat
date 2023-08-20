// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String id;
  String username;
  String fullName;
  String description;
  String type;
  String telegram;
  String instagram;
  String facebook;
  String image;
  int countPost;

  ProfileModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.description,
    required this.type,
    required this.telegram,
    required this.instagram,
    required this.facebook,
    required this.image,
    required this.countPost,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        username: json["username"],
        fullName: json["fullName"],
        description: json["description"],
        type: json["type"],
        telegram: json["telegram"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        image: json["image"],
        countPost: json["countPost"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullName": fullName,
        "description": description,
        "type": type,
        "telegram": telegram,
        "instagram": instagram,
        "facebook": facebook,
        "image": image,
        "countPost": countPost,
      };
}
