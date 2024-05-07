// To parse this JSON data, do
//
//     final religiousPostModel = religiousPostModelFromJson(jsonString);

import 'dart:convert';

List<ReligiousPostModel> religiousPostModelFromJson(String str) =>
    List<ReligiousPostModel>.from(
        json.decode(str).map((x) => ReligiousPostModel.fromJson(x)));

String religiousPostModelToJson(List<ReligiousPostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReligiousPostModel {
  int id;
  String title;
  String content;
  String cover;
  DateTime created;
  int category;
  String categoryName;

  ReligiousPostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
    required this.created,
    required this.category,
    required this.categoryName,
  });

  factory ReligiousPostModel.fromJson(Map<String, dynamic> json) =>
      ReligiousPostModel(
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
