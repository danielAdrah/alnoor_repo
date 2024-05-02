import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../notification_/view/notification_view.dart';
import '../user_profile/model/profile_controller.dart';
import '../user_profile/view/user_profile_view.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final String name;
  const CustomAppBar({super.key, required this.title, required this.name});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeInLeft(
                delay: Duration(milliseconds: 500),
                child: IconButton(
                    onPressed: () {
                      Get.to(NotificationView());
                    },
                    icon: Image.asset(
                      "assets/img/white_notif_icon.png",
                      color: TColor.primary,
                    )),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ZoomIn(
                        curve: Curves.decelerate,
                        delay: Duration(milliseconds: 600),
                        child: Text(
                          widget.title,
                        ),
                      ),
                      ZoomIn(
                        delay: Duration(milliseconds: 600),
                        curve: Curves.decelerate,
                        child: Text(
                          widget.name,
                          style: const TextStyle(color: TColor.primary),
                        ),
                      ), //in this text it will be the TextController from the textfield
                    ],
                  ),
                  FadeInRight(
                    delay: Duration(milliseconds: 500),
                    child: InkWell(
                      onTap: () {
                        Get.to(const UserProfileView());
                      },
                      child: CircleAvatar(
                          // radius: 20,
                          backgroundImage: controller.imagePath.value == null
                              ? AssetImage("assets/img/bigAvatar.png")
                                  as ImageProvider<Object>?
                              : FileImage(File(controller.imagePath.value!))
                                  as ImageProvider<Object>?),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     Get.to(const UserProfileView());
                  //   },
                  //   icon: controller.imagePath.value == null
                  //       ? Image.asset("assets/img/avatar.png") as Widget
                  //       : File(controller.imagePath.value!)
                  //           as Widget,
                  // ),
                ],
              ),
            ],
          ),
        ));
  }
}
