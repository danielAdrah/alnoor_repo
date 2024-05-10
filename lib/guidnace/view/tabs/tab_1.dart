import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../comon_widgets/relegious_list_tile.dart';
import '../../../core/api/dio_consumer.dart';
import '../../../theme.dart';
import '../../controller/guidnace_controller.dart';
import '../single_post.dart';

class Tab1 extends StatefulWidget {
  final String category;
  const Tab1({super.key, required this.category});

  @override
  State<Tab1> createState() => _Tab1State();
}

//التحلل
class _Tab1State extends State<Tab1> {
  GuidnaceController controller =
      Get.put(GuidnaceController(api: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getGuidPost(widget.category),
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
                  var data = snapshot.data![index];
                  return ZoomIn(
                    delay: Duration(milliseconds: 800),
                    curve: Curves.easeIn,
                    child: RelegiousListTile(
                      onTap: () {
                        Get.to(SinglePost(
                          appBarTitle: 'التحلل',
                        ));
                      },
                      title: data.title,
                      subTitle: data.content,
                      image: data.cover,
                      date: data.created,
                    ),
                  );
                });
          }
        }); //
  }
}
