import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/splash&&onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/icon_primary_button.dart';
import '../../theme.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  // getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   print(serviceEnabled);
  //   if (serviceEnabled == false) {
  //     return AboutDialog(
  //       children: [
  //         Text("رجاء قم بتشغيل الموقع"),
  //       ],
  //     );
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       //here what will show if denied
  //     }
  //     if (permission == LocationPermission.deniedForever) {
  //       //will display if denied for ever
  //     }

  //     if (permission == LocationPermission.whileInUse) {
  //       Position position = await Geolocator.getCurrentPosition();
  //       print("-----------------------------");
  //       print(position.longitude);
  //       print(position.latitude);
  //       // later we need to store the longitude and latitude and send it to the api
  //     }
  //   }
  // }

  @override
  void initState() {
    // getCurrentLocation();
    super.initState();
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 70),
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: const Image(
                    image: AssetImage("assets/img/logo.png"),
                    height: 150,
                    width: 150),
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 600),
                child: Text(
                  "نرحب بكم في حملة النور للحج\n والعمرة بالقديح",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.primary,
                    fontSize: media.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInRight(
                delay: const Duration(milliseconds: 600),
                child: const Image(
                  image: AssetImage("assets/img/welcome_splash.png"),
                ),
              ),
              const SizedBox(height: 15),
              FadeInRight(
                delay: const Duration(milliseconds: 700),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20, horizontal: media.width * 0.04),
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: IconPrimaryButton(
                      onTap: () {
                        Get.to(const OnboardingScreen());
                      },
                      text: "التالي",
                      icon: Icons.arrow_forward,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
