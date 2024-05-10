// To parse this JSON data, do
//
//     final indiviualGuidnaceModel = indiviualGuidnaceModelFromJson(jsonString);

import 'dart:convert';

IndiviualGuidnaceModel indiviualGuidnaceModelFromJson(String str) =>
    IndiviualGuidnaceModel.fromJson(json.decode(str));

String indiviualGuidnaceModelToJson(IndiviualGuidnaceModel data) =>
    json.encode(data.toJson());

class IndiviualGuidnaceModel {
  int id;
  String title;
  String content;
  String cover;
  DateTime created;
  int category;

  IndiviualGuidnaceModel({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
    required this.created,
    required this.category,
  });

  factory IndiviualGuidnaceModel.fromJson(Map<String, dynamic> json) =>
      IndiviualGuidnaceModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        cover: json["cover"],
        created: DateTime.parse(json["created"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "cover": cover,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "category": category,
      };
}
