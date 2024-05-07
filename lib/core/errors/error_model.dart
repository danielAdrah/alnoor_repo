// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  List<String> nonFieldErrors;

  ErrorModel({
    required this.nonFieldErrors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        nonFieldErrors:
            List<String>.from(json["non_field_errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "non_field_errors": List<dynamic>.from(nonFieldErrors.map((x) => x)),
      };
}
