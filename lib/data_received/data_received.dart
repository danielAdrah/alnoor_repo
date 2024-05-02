import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/comon_widgets/custom_text_field.dart';
import 'package:elnoor_haj/comon_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/views/log_in.dart';
import '../theme.dart';

class DataReceived extends StatelessWidget {
  const DataReceived({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.png"),
              alignment: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: const Image(
                  image: AssetImage("assets/img/logo.png"),
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 40),
              FadeInLeft(
                delay: Duration(milliseconds: 500),
                child: Text(
                  "تم استلام بياناتك",
                  style: TextStyle(
                      color: TColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: media.width * 0.055),
                ),
              ),
              const SizedBox(height: 10),
              FadeInRight(
                delay: Duration(milliseconds: 700),
                child: Text(
                  "سيتواصل  معك  مسؤول  المكتب  لإنهاء  إجراءات \nالتسجيل ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: media.width * 0.04),
                ),
              ),
              const SizedBox(height: 10),
              Image(image: AssetImage("assets/img/data_done.png")),
              const SizedBox(height: 70),
              FadeInLeft(
                delay: Duration(milliseconds: 700),
                child: PrimaryButton(
                    onTap: () {
                      Get.to(LogInView());
                    },
                    text: "تسجيل "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
