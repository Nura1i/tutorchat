// To parse this JSON data, do
//
//     final userFollowingListModel = userFollowingListModelFromJson(jsonString);

import 'dart:convert';

List<UserFollowingListModel> userFollowingListModelFromJson(String str) =>
    List<UserFollowingListModel>.from(
        json.decode(str).map((x) => UserFollowingListModel.fromJson(x)));

String userFollowingListModelToJson(List<UserFollowingListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserFollowingListModel {
  String id;
  String username;
  String fullName;
  String image;

  UserFollowingListModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.image,
  });

  factory UserFollowingListModel.fromJson(Map<String, dynamic> json) =>
      UserFollowingListModel(
        id: json["id"],
        username: json["username"],
        fullName: json["fullName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullName": fullName,
        "image": image,
      };
}
