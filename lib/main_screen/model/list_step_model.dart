// To parse this JSON data, do
//
//     final stepsModel = stepsModelFromJson(jsonString);

import 'dart:convert';

List<StepsModel> stepsModelFromJson(String str) =>
    List<StepsModel>.from(json.decode(str).map((x) => StepsModel.fromJson(x)));

String stepsModelToJson(List<StepsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StepsModel {
  int id;
  List<SecondaryStep> secondarySteps;
  String name;

  StepsModel({
    required this.id,
    required this.secondarySteps,
    required this.name,
  });

  factory StepsModel.fromJson(Map<String, dynamic> json) => StepsModel(
        id: json["id"],
        secondarySteps: List<SecondaryStep>.from(
            json["secondary_steps"].map((x) => SecondaryStep.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "secondary_steps":
            List<dynamic>.from(secondarySteps.map((x) => x.toJson())),
        "name": name,
      };
}

class SecondaryStep {
  String name;
  String note;

  SecondaryStep({
    required this.name,
    required this.note,
  });

  factory SecondaryStep.fromJson(Map<String, dynamic> json) => SecondaryStep(
        name: json["name"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "note": note,
      };
}
