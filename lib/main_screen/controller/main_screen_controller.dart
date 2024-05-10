// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_haj/core/api/api_consumer.dart';
import 'package:elnoor_haj/core/api/end_points.dart';
import 'package:elnoor_haj/core/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/list_step_model.dart';
import '../model/prayer_time_model.dart';

class MainScreenController extends GetxController {
  final ApiConsumer api;
  MainScreenController({required this.api});
//============================================
  final GetStorage storage = GetStorage();

  var dio = Dio(
    BaseOptions(
      baseUrl: "http://85.31.237.33/test/api/",
    ),
  );
  String? stepName;
  int? stepId;
  List<SecondaryStep> secondarSteps = [];
  List<StepsModel> finalStep = [];
  PrayerTimeModel? times;
//============================================

  Future<List<StepsModel>> fetchStep() async {
    try {
      var response = await dio.get(
        EndPoint.listSteps,
      );
      print("the response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<StepsModel> steps =
          jsonResponse.map((e) => StepsModel.fromJson(e)).toList();

      return steps;
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

//===========================================================
  fetchPrayerTime() async {
    try {
      var long = storage.read("longitude");
      var alt = storage.read("altitude");
      int day = DateTime.now().day;
      int month = DateTime.now().month;
      int year = DateTime.now().year;
      print("alt $alt");
      var response = await api.post(EndPoint.prayerTime, data: {
        ApiKeys.longitude: long,
        ApiKeys.latitude: 10,
        ApiKeys.day: day,
        ApiKeys.month: month,
        ApiKeys.year: year,
      });
      print("1");
      print("the time is ${response}");
      times = PrayerTimeModel.fromJson(response);
      print("2 ${times!.timings.asr}");
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
