import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_app_bar2.dart';
import '../../core/api/dio_consumer.dart';
import '../../notification_/view/notification_view.dart';
import '../../theme.dart';
import '../controller/guidnace_controller.dart';

class SinglePost extends StatefulWidget {
  final String appBarTitle;
  const SinglePost({
    super.key,
    required this.appBarTitle,
  });

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  GuidnaceController controller =
      Get.put(GuidnaceController(api: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.appBarTitle),
        leading: IconButton(
          onPressed: () {
            Get.to(const NotificationView());
          },
          icon: Image.asset("assets/img/white_notif_icon.png"),
          color: TColor.primary,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset("assets/img/white_arrowBack.png"),
            color: TColor.black,
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                FutureBuilder(
                  future: controller.fetchGuidnacePost(),
                  builder: (context, snapshot) {
                    var data = snapshot.data!;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        alignment: Alignment.topCenter,
                        height: media.width * 0.9,
                        width: media.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img/alqublah.png"),
                                fit: BoxFit.fill)),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return Container(
                        alignment: Alignment.topCenter,
                        height: media.width * 0.9,
                        width: media.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data.cover),
                                fit: BoxFit.fill)),
                      );
                    }
                  },
                )
              ],
            ),
            Positioned(
              top: 280,
              child: Container(
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: media.height,
                width: media.width,
                child: FutureBuilder(
                    future: controller.fetchGuidnacePost(),
                    builder: (context, snapshot) {
                      var data = snapshot.data!;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: TColor.primary,
                        ));
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(right: media.width * 0.04),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: media.width * 0.05),
                                Text(
                                  data.title,
                                  style: TextStyle(
                                      color: TColor.black, fontSize: 20),
                                ),
                                SizedBox(
                                  height: media.width * 0.02,
                                ),
                                Text(
                                  data.created.toString().substring(0, 11),
                                  style: TextStyle(
                                      color: TColor.primary, fontSize: 16),
                                ),
                                SizedBox(height: media.width * 0.03),
                                Text(
                                  data.content,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: media.width * 0.04),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                //
              ),
            ),
          ],
        ),
      ),
    );
  }
}
