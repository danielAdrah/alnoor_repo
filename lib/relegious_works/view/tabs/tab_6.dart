import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:elnoor_haj/login/model/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../comon_widgets/relegious_list_tile.dart';
import '../../../core/api/dio_consumer.dart';
import '../../../theme.dart';
import '../../controller/religous_post_controller.dart';
import '../indivicual_post.dart';

class Tab6 extends StatefulWidget {
  const Tab6({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<Tab6> createState() => _Tab6State();
}

//النية
class _Tab6State extends State<Tab6> {
  // final ReligousPostController controller = Get.find<ReligousPostController>();
  ReligousPostController controller =
      Get.put(ReligousPostController(api: DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getPost(widget.categoryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: TColor.primary,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print("sdsdsds ${controller.postList.length}");
                  return FadeInRightBig(
                    delay: const Duration(milliseconds: 700),
                    child: RelegiousListTile(
                      onTap: () {
                        Get.to(IndivicualPost(
                          appBarTitle: 'النية',
                        ));
                      },
                      title: snapshot.data![index].title,
                      subTitle: snapshot.data![index].content,
                      date: snapshot.data![index].created,
                      image: snapshot.data![index].cover,
                    ),
                  );
                });
          }
        });
  }
}
