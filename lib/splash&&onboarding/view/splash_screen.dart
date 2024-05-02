import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/splash&&onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startApp() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(const SplashScreen2());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.png"),
              alignment: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200),
              ZoomIn(curve: Curves.easeInCirc,
                  delay: const Duration(milliseconds: 2500),
                  child: const Image(image: AssetImage("assets/img/logo.png"))),
              MaterialButton(onPressed: () {}, child: const Text(""))
            ],
          ),
        ),
      ),
    );
  }
}
