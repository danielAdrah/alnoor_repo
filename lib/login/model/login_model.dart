// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  String username;
  int chatId;
  String image;
  int id;
  Tokens tokens;

  LogInModel({
    required this.username,
    required this.chatId,
    required this.image,
    required this.id,
    required this.tokens,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        username: json["username"],
        chatId: json["chat_id"],
        image: json["image"],
        id: json["id"],
        tokens: Tokens.fromJson(json["tokens"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "chat_id": chatId,
        "image": image,
        "id": id,
        "tokens": tokens.toJson(),
      };
}

class Tokens {
  String refresh;
  String access;

  Tokens({
    required this.refresh,
    required this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
