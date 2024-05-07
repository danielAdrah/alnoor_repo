import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../comon_widgets/relegious_list_tile.dart';
import '../../../core/api/dio_consumer.dart';
import '../../../theme.dart';
import '../../controller/religous_post_controller.dart';
import '../indivicual_post.dart';

class Tab3 extends StatefulWidget {
  final String categoryName;
  const Tab3({super.key, required this.categoryName});

  @override
  State<Tab3> createState() => _Tab3State();
}

//السعي
class _Tab3State extends State<Tab3> {
  ReligousPostController controller =
      Get.put(ReligousPostController(api: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getPost(widget.categoryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: TColor.primary,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ZoomIn(
                    delay: Duration(milliseconds: 700),
                    curve: Curves.easeIn,
                    child: RelegiousListTile(
                      onTap: () {
                        Get.to(IndivicualPost(
                          appBarTitle: 'السعي',
                        ));
                      },
                      title: snapshot.data![index].title,
                      image: snapshot.data![index].cover,
                      subTitle: snapshot.data![index].content,
                      date: snapshot.data![index].created,
                    ),
                  );
                });
          }
        });

    //
  }
}
