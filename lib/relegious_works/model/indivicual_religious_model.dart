// To parse this JSON data, do
//
//     final indiviualReligiousModel = indiviualReligiousModelFromJson(jsonString);

import 'dart:convert';

IndiviualReligiousModel indiviualReligiousModelFromJson(String str) =>
    IndiviualReligiousModel.fromJson(json.decode(str));

String indiviualReligiousModelToJson(IndiviualReligiousModel data) =>
    json.encode(data.toJson());

class IndiviualReligiousModel {
  int id;
  String title;
  String content;
  String cover;
  DateTime created;
  int category;

  IndiviualReligiousModel({
    required this.id,
    required this.title,
    required this.content,
    required this.cover,
    required this.created,
    required this.category,
  });

  factory IndiviualReligiousModel.fromJson(Map<String, dynamic> json) =>
      IndiviualReligiousModel(
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
