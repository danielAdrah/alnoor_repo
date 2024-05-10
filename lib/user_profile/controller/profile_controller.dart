// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_haj/core/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api/end_points.dart';
import '../../login/model/user_state.dart';
import '../model/user_info_model.dart';

class ProfileController extends GetxController {
  final GetStorage storage = GetStorage();
  Rx<XFile?> image = Rx<XFile?>(null);
  Rx<String?> imagePath = Rx<String?>(null);
  final imagePicker = ImagePicker();
  //=========================
  List<UserInfoModel> piligrmInfoList = [];
  UserInfoModel? pilgrimInfoo;
  var dio = Dio(
    BaseOptions(
      baseUrl: "http://85.31.237.33/test/api/",
    ),
  );
  UserState userState = UserInitial();
//===========================================================
  @override
  void onInit() {
    super.onInit();
    // Load the image path from storage when the controller is initialized
    imagePath.value = storage.read('imagePath');
  }

  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
      storage.write('imagePath', pickedImage.path);
      // image.value = XFile(pickedImage.path);
    } else {}
  }
  //=================================================================

  Future<UserInfoModel> fetchPilgremInfo() async {
    try {
      userState = OnInfoLoading();
      var stored = storage.read("pilgramId");
      print("the client id is $stored");
      var response = await dio.get(
        EndPoint.getPilgrimInfo(stored),
      );
      print(" the info you need are $response");
      UserInfoModel userInfo = UserInfoModel.fromJson(response.data);
      print("dddddddddddddddddddddd${userInfo.flightDate}");
      pilgrimInfoo = userInfo;
      print("the another is ${pilgrimInfoo!.active}");
      return userInfo;
    } on ServerExcption catch (e) {
      print("errooorrr");
      userState =
          OnInfoFailure(errMessage: e.errModel.nonFieldErrors.toString());

      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
