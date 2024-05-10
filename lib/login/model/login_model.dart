// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  String username;
  int guideChatId;
  int managerChatId;
  String image;
  int userId;
  int pilgrimId;
  Tokens tokens;

  LogInModel({
    required this.username,
    required this.guideChatId,
    required this.managerChatId,
    required this.image,
    required this.userId,
    required this.pilgrimId,
    required this.tokens,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        username: json["username"],
        guideChatId: json["guide_chat_id"],
        managerChatId: json["manager_chat_id"],
        image: json["image"],
        userId: json["user_id"],
        pilgrimId: json["pilgrim_id"],
        tokens: Tokens.fromJson(json["tokens"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "guide_chat_id": guideChatId,
        "manager_chat_id": managerChatId,
        "image": image,
        "user_id": userId,
        "pilgrim_id": pilgrimId,
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
