import 'package:elnoor_haj/core/api/end_points.dart';
import 'package:elnoor_haj/core/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api/api_consumer.dart';
import '../../main_tab_view/view/main_tab_view.dart';
import '../model/login_model.dart';
import '../model/user_state.dart';

class LogInController extends GetxController {
  final ApiConsumer api;
  LogInController({required this.api});
  //============logInControllers===================
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //====================================
  UserState userState = UserInitial();
  final GetStorage storage = GetStorage();
  LogInModel? logInUser;

  logIn() async {
    userState = LogInLoading();
    update();
    try {
      final response = await api.post(
        EndPoint.logIn,
        data: {
          ApiKeys.username: numberController.text,
          ApiKeys.password: passController.text,
        },
      );
      logInUser = LogInModel.fromJson(response);
      final logInAccessToken = logInUser!.tokens.access;
      final logInRefrechToken = logInUser!.tokens.refresh;
      final logInId = logInUser!.id;
      storage.write("accessToken", logInAccessToken);
      storage.write("refreshToken", logInRefrechToken);
      storage.write("id", logInId);

      userState = LogInSuccess();
      update();
      Get.to(const MainTabView());
    } on ServerExcption catch (e) {
      print("errorrrrrrrrrr");
      userState =
          LogInFailure(errMessage: e.errModel.nonFieldErrors.toString());
      update();
    }
  }
}
