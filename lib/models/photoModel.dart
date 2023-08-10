// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

PhotoModel photoModelFromJson(String str) =>
    PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
  String id;
  String originalName;
  String path;
  int? size;
  String extension;
  int? duration;
  String ownerId;
  DateTime createdOn;
  String url;

  PhotoModel({
    required this.id,
    required this.originalName,
    required this.path,
    required this.size,
    required this.extension,
    required this.duration,
    required this.ownerId,
    required this.createdOn,
    required this.url,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json["id"],
        originalName: json["originalName"],
        path: json["path"],
        size: json["size"],
        extension: json["extension"],
        duration: json["duration"],
        ownerId: json["ownerId"],
        createdOn: DateTime.parse(json["createdOn"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "originalName": originalName,
        "path": path,
        "size": size,
        "extension": extension,
        "duration": duration,
        "ownerId": ownerId,
        "createdOn": createdOn.toIso8601String(),
        "url": url,
      };
}
