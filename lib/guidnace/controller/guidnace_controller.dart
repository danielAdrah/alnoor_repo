// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_haj/core/api/api_consumer.dart';
import 'package:elnoor_haj/core/api/end_points.dart';
import 'package:elnoor_haj/core/errors/exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/indiviual_guidnace_model.dart';
import '../../login/model/user_state.dart';
import '../model/guidnace_model.dart';

class GuidnaceController extends GetxController {
  ApiConsumer api;
  GuidnaceController({required this.api});
  Rxn<UserState> userState = Rxn<UserState>();
  final GetStorage storage = GetStorage();
  RxList<GuidnaceModel> guidPostList = <GuidnaceModel>[].obs;
  List<IndiviualGuidnaceModel> indiviualGuidePost = [];
  //===================================
  var dio = Dio(
    BaseOptions(baseUrl: "http://85.31.237.33/test/api/"),
  );
  Future<List<GuidnaceModel>> getGuidPost(String category) async {
    try {
      userState.value = GuidePostLoading();
      var response = await dio.get(EndPoint.guidnacePost, queryParameters: {
        "category_name": category,
      });
      List<dynamic> jsonData = response.data;
      print("looooooke over here guidnace${jsonData}");
      List<GuidnaceModel> guidePosts =
          jsonData.map((e) => GuidnaceModel.fromJson(e)).toList();
      var guideId;
      for (var guide in guidePosts) {
        var post = guide.id;
        guideId = post;
      }
      await storage.write("guidePostId", guideId);

      print("outside on the guide ${guideId}");
      return guidePosts;
    } on ServerExcption catch (e) {
      userState.value =
          GuidePostFailure(errMessage: e.errModel.nonFieldErrors.toString());
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //=========================================================================
  Future<IndiviualGuidnaceModel> fetchGuidnacePost() async {
    try {
      var storedId = await storage.read("guidePostId");
      print("stored id is $storedId");
      var response = await dio.get(
        EndPoint.getindiviualGuidnacePost(storedId),
      );
      print("the response before parsing is ${response.data}");
      IndiviualGuidnaceModel singleGuidePost =
          IndiviualGuidnaceModel.fromJson(response.data);
      print("the single guide is ${singleGuidePost.created}");
      indiviualGuidePost = [singleGuidePost];
      return singleGuidePost;
    } on ServerExcption catch (e) {
      userState.value =
          OnePostFailure(errMessage: e.errModel.nonFieldErrors.toString());

      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
