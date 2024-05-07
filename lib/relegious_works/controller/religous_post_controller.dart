// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:elnoor_haj/core/api/api_consumer.dart';
import 'package:elnoor_haj/core/api/end_points.dart';
import 'package:elnoor_haj/core/errors/exceptions.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

import '../../login/model/user_state.dart';
import '../model/indivicual_religious_model.dart';
import '../model/religious_post_model.dart';

class ReligousPostController extends GetxController {
  final ApiConsumer api;
  ReligousPostController({required this.api});
  //==============================================================

  final GetStorage storage = GetStorage();
  Rxn<UserState> userState = Rxn<UserState>();
  RxList<ReligiousPostModel> postList = <ReligiousPostModel>[].obs;
  List<IndiviualReligiousModel> indiviualPost = [];

  //============================================================
  var dio = Dio(
    BaseOptions(
      baseUrl: "http://85.31.237.33/test/api/",
    ),
  );
  Future<List<ReligiousPostModel>> getPost(String category) async {
    userState.value = PostLoading();
    try {
      // var response = await api.get(
      //   EndPoint.getReligousPost(category.toString()),
      // );

      var response = await dio.get(EndPoint.religousPost, queryParameters: {
        "category_name": category,
      });

      print(response.data);

      List<dynamic> jsonResponse = response.data;
      print("loook at meeeeee $jsonResponse");
      List<ReligiousPostModel> posts =
          jsonResponse.map((e) => ReligiousPostModel.fromJson(e)).toList();
      // List postIds = [];
      var id;
      for (var post in posts) {
        var postId = post.id;
        // postIds.add(postId);
        id = postId;
      }
      print("out of the loop $id");
      await storage.write("workPostsId", id);

      return posts;
      // return jsonResponse.map((e) => ReligiousPostModel.fromJson(e)).toList();
    } on ServerExcption catch (e) {
      userState.value =
          PostFailure(errMessage: e.errModel.nonFieldErrors.toString());
      e.errModel.nonFieldErrors.toString();
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
  //===================================================================================

  Future<IndiviualReligiousModel> fetchReligiousPost() async {
    try {
      userState.value = OnePostLoading();
      var stored = await storage.read("workPostsId");
      print("stored is ${stored}");

      print("before response");
      var response = await dio.get(
        EndPoint.getindiviualReligiousPost(stored),
      );
      print("the answer from everyone is ${response.data}");
      IndiviualReligiousModel singlePost =
          IndiviualReligiousModel.fromJson(response.data);
      print("the single post is ${singlePost.content}");
      indiviualPost = [singlePost];
      return singlePost;
    } on ServerExcption catch (e) {
      userState.value =
          OnePostFailure(errMessage: e.errModel.nonFieldErrors.toString());

      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
