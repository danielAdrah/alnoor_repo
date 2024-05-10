// To parse this JSON data, do
//
//     final prayerTimeModel = prayerTimeModelFromJson(jsonString);

import 'dart:convert';

PrayerTimeModel prayerTimeModelFromJson(String str) =>
    PrayerTimeModel.fromJson(json.decode(str));

String prayerTimeModelToJson(PrayerTimeModel data) =>
    json.encode(data.toJson());

class PrayerTimeModel {
  Timings timings;
  Gregorian gregorian;
  String city;

  PrayerTimeModel({
    required this.timings,
    required this.gregorian,
    required this.city,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimeModel(
        timings: Timings.fromJson(json["timings"]),
        gregorian: Gregorian.fromJson(json["gregorian"]),
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "gregorian": gregorian.toJson(),
        "city": city,
      };
}

class Gregorian {
  String day;
  String month;
  String year;

  Gregorian({
    required this.day,
    required this.month,
    required this.year,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Timings {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;
  String firstthird;
  String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstthird: json["Firstthird"],
        lastthird: json["Lastthird"],
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
        "Firstthird": firstthird,
        "Lastthird": lastthird,
      };
}
