import 'package:elnoor_haj/core/api/api_consumer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final ApiConsumer api;
  MainScreenController({required this.api});
//============================================
  RxBool isDoneIhram = false.obs;
  RxBool isDoneFloat = false.obs;
  RxBool isDoneSeek = false.obs;
  RxBool isDoneHalal = false.obs;
//============================================
}
