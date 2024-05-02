import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/comon_widgets/custom_text_field.dart';
import 'package:elnoor_haj/comon_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/password_custome_text_field.dart';
import '../../forget_password%verfiy_code/view/forget_password.dart';
import '../../main_screen/views/main_screen.dart';
import '../../main_tab_view/view/main_tab_view.dart';
import '../../theme.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
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
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: const Image(
                  image: AssetImage("assets/img/logo.png"),
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 20),
              FadeInLeft(
                delay: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    "  تسجيل الدخول",
                    style: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: media.width * 0.055),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInRight(
                delay: const Duration(milliseconds: 500),
                child: Text(
                  "ادخل رقم الجوال الخاص بك و كلمة المرور \nالمرسلة في رسالة نصية إليك ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: media.width * 0.04),
                ),
              ),
              FadeInRight(
                delay: Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.05),
                      child: const Text("رقم الجوال"),
                    ),
                    const SizedBox(height: 11),
                    NumberTextField(
                      labelText: "ادخل رقم جوالك",
                      onChanged: (p0) {},
                    )
                  ],
                ),
              ),
              const SizedBox(height: 9),
              FadeInLeft(
                delay: Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.05),
                      child: const Text(" كلمة المرور"),
                    ),
                    const SizedBox(height: 10),
                    PasswordCustomTextField(
                        secure: true,
                        hintText: "ادخل  كلمة المرور",
                        keyboardType: TextInputType.text),
                  ],
                ),
              ),
              FadeInLeft(
                delay: Duration(milliseconds: 500),
                child: Align(
                  alignment: Alignment(0.9, 0.1),
                  child: TextButton(
                      onPressed: () {
                        Get.to(const ForgetPassword());
                      },
                      child: const Text(
                        "هل نسيت كلمة المرور",
                        style: TextStyle(
                            color: TColor.primary, fontWeight: FontWeight.w700),
                      )),
                ),
              ),
              // const SizedBox(height: 100)
              FadeInRight(
                delay: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20, horizontal: media.width * 0.04),
                  child: PrimaryButton(
                      onTap: () {
                        Get.to(const MainTabView());
                      },
                      text: "تسجيل"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
