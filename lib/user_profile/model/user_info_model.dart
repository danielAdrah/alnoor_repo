// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  int id;
  String? phonenumber;
  int guideChat;
  int managerChat;
  String? duration;
  String? image;
  String? registerationId;
  String? firstName;
  String? fatherName;
  String? grandFather;
  String? lastName;
  DateTime birthday;
  int flightNum;
  DateTime arrival;
  DateTime departure;
  String? fromCity;
  String? toCity;
  String? boradingTime;
  int gateNum;
  String? flightCompany;
  String? flightDate;
  String? companyLogo;
  bool status;
  bool active;
  String? hotel;
  String? hotelAddress;
  int roomNum;
  DateTime created;
  int user;
  List<int> hajSteps;

  UserInfoModel({
    required this.id,
    required this.phonenumber,
    required this.guideChat,
    required this.managerChat,
    required this.duration,
    required this.image,
    required this.active,
    required this.registerationId,
    required this.firstName,
    required this.fatherName,
    required this.grandFather,
    required this.lastName,
    required this.birthday,
    required this.flightNum,
    required this.arrival,
    required this.departure,
    required this.fromCity,
    required this.toCity,
    required this.boradingTime,
    required this.gateNum,
    required this.flightCompany,
    required this.flightDate,
    required this.companyLogo,
    required this.status,
    required this.hotel,
    required this.hotelAddress,
    required this.roomNum,
    required this.created,
    required this.user,
    required this.hajSteps,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["id"],
        phonenumber: json["phonenumber"],
        guideChat: json["guide_chat"],
        managerChat: json["manager_chat"],
        duration: json["duration"],
        image: json["image"],
        registerationId: json["registeration_id"],
        firstName: json["first_name"],
        fatherName: json["father_name"],
        grandFather: json["grand_father"],
        lastName: json["last_name"],
        birthday: DateTime.parse(json["birthday"]),
        flightNum: json["flight_num"],
        flightDate: json["flight_date"],
        arrival: DateTime.parse(json["arrival"]),
        departure: DateTime.parse(json["departure"]),
        fromCity: json["from_city"],
        toCity: json["to_city"],
        boradingTime: json["borading_time"],
        gateNum: json["gate_num"],
        flightCompany: json["flight_company"],
        companyLogo: json["company_logo"],
        status: json["status"],
        active: json["active"],
        hotel: json["hotel"],
        hotelAddress: json["hotel_address"],
        roomNum: json["room_num"],
        created: DateTime.parse(json["created"]),
        user: json["user"],
        hajSteps: List<int>.from(json["haj_steps"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phonenumber": phonenumber,
        "guide_chat": guideChat,
        "manager_chat": managerChat,
        "duration": duration,
        "image": image,
        "registeration_id": registerationId,
        "first_name": firstName,
        "father_name": fatherName,
        "grand_father": grandFather,
        "last_name": lastName,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "flight_num": flightNum,
        "arrival": arrival.toIso8601String(),
        "departure": departure.toIso8601String(),
        "from_city": fromCity,
        "to_city": toCity,
        "borading_time": boradingTime,
        "gate_num": gateNum,
        "flight_company": flightCompany,
        "flight_date": flightDate,
        "company_logo": companyLogo,
        "status": status,
        "active": active,
        "hotel": hotel,
        "hotel_address": hotelAddress,
        "room_num": roomNum,
        "created": created.toIso8601String(),
        "user": user,
        "haj_steps": List<dynamic>.from(hajSteps.map((x) => x)),
      };
}
