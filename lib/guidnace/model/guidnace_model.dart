// To parse this JSON data, do
//
//     final guidnaceModel = guidnaceModelFromJson(jsonString);

import 'dart:convert';

List<GuidnaceModel> guidnaceModelFromJson(String str) =>
    List<GuidnaceModel>.from(
        json.decode(str).map((x) => GuidnaceModel.fromJson(x)));

String guidnaceModelToJson(List<GuidnaceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GuidnaceModel {
  int id;
  String title;
  String content;
  String cover;
  DateTime created;
  int category;
  String categoryName;

  GuidnaceModel({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
    required this.created,
    required this.category,
    required this.categoryName,
  });

  factory GuidnaceModel.fromJson(Map<String, dynamic> json) => GuidnaceModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        cover: json["cover"],
        created: DateTime.parse(json["created"]),
        category: json["category"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "cover": cover,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "category": category,
        "category_name": categoryName,
      };
}
