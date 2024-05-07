import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../comon_widgets/relegious_list_tile.dart';
import '../../../core/api/dio_consumer.dart';
import '../../../theme.dart';
import '../../controller/guidnace_controller.dart';

class Tab6 extends StatefulWidget {
  final String category;
  const Tab6({super.key, required this.category});

  @override
  State<Tab6> createState() => _Tab6State();
}

//النية
class _Tab6State extends State<Tab6> {
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
                  return FadeInRightBig(
                    delay: Duration(milliseconds: 800),
                    curve: Curves.easeIn,
                    child: RelegiousListTile(
                      onTap: () {},
                      title: data.title,
                      subTitle: data.content,
                      image: data.cover,
                      date: data.created,
                    ),
                  );
                });
          }
        });
    //
  }
}
