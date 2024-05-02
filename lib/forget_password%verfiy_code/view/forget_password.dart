import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_text_field.dart';
import '../../comon_widgets/icon_primary_button.dart';
import '../../comon_widgets/number_text_field.dart';
import '../../theme.dart';
import 'verfiy_code.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                delay: const Duration(milliseconds: 700),
                child: Center(
                  child: Text(
                    "  نسيت كلمة المرور؟ ",
                    style: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: media.width * 0.055),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInRight(
                delay: const Duration(milliseconds: 700),
                child: Text(
                  "لا تقلق فقط اكتب رقم الجوال الخاص بك \nو سنرسل رقم التحقيق إليك ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: media.width * 0.04),
                ),
              ),
              const SizedBox(height: 20),
              FadeInLeft(
                delay: Duration(milliseconds: 700),
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
                      onChanged: (phoneNumber){},
                    ),
                    FadeInRight(
                      delay: Duration(milliseconds: 700),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: media.width * 0.04),
                        child: IconPrimaryButton(
                          onTap: () {
                            Get.to(VerfiyCode());
                          },
                          text: "التالي",
                          icon: Icons.arrow_forward,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
