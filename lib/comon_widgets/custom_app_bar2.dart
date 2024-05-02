import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/notification_/view/notification_view.dart';
import 'package:elnoor_haj/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar2 extends StatelessWidget {
  CustomAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                icon: Image.asset("assets/img/white_notif_icon.png")),
          ),
          FadeInDownBig(
            delay: Duration(milliseconds: 600),
            child: Text(
              "الحساب",
              style: TextStyle(
                  color: TColor.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 500),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset("assets/img/white_arrowBack.png")),
          )
        ],
      ),
    );
  }
}
