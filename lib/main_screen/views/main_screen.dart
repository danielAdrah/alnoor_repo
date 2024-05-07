import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../comon_widgets/custom_app_bar.dart';
import '../../comon_widgets/step_circle.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';

import '../controller/main_screen_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenController controller =
      Get.put(MainScreenController(api: DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomAppBar(
                  title: "حياك الله اخي الكريم",
                  name: "الاسم",
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.026),
                child: ZoomIn(
                  delay: const Duration(milliseconds: 700),
                  curve: Curves.decelerate,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage("assets/img/weather_rec1.png"),
                            fit: BoxFit.fill)),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "الضهر",
                                style: TextStyle(
                                    color: TColor.white, fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "12:30",
                                style: TextStyle(
                                    color: TColor.white, fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "بتوقيت مكة المكرمة",
                                style: TextStyle(
                                    color: TColor.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "العشاء",
                                  style: TextStyle(color: TColor.white),
                                ),
                                Text(
                                  "7:30",
                                  style: TextStyle(color: TColor.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "العشاء",
                                  style: TextStyle(color: TColor.white),
                                ),
                                Text(
                                  "7:30",
                                  style: TextStyle(color: TColor.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "العشاء",
                                  style: TextStyle(color: TColor.white),
                                ),
                                Text(
                                  "7:30",
                                  style: TextStyle(color: TColor.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "العشاء",
                                  style: TextStyle(color: TColor.white),
                                ),
                                Text(
                                  "7:30",
                                  style: TextStyle(color: TColor.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "العشاء",
                                  style: TextStyle(color: TColor.white),
                                ),
                                Text(
                                  "7:30",
                                  style: TextStyle(color: TColor.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "العشاء",
                                  style: TextStyle(color: TColor.white),
                                ),
                                Text(
                                  "7:30",
                                  style: TextStyle(color: TColor.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeInRight(
                    delay: const Duration(milliseconds: 700),
                    child: const Text(
                      "خط السير",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topCenter,
                height: media.height,
                // width: media.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/steps.png"),
                        alignment: Alignment(-0.02, -0.6))),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    FadeInRight(
                      delay: const Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.6, 2),
                            child: StepCircle(
                              index: "1",
                              title: "الإحرام",
                              onTap: () {},
                            ),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(0.44, 2),
                            child: Text("النية"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(0.79, 2),
                            child: Text("الاغتسال"),
                          ),
                          // const SizedBox(height: 2),
                          const Align(
                            alignment: Alignment(0.4, 1.8),
                            child: Text("لبس الإحرام"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(0.9, 2),
                            child: Text("صلاة ركعتين"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(0.3, 2),
                            child: Text(" قول " "لبيك اللهم لبيك"),
                          ),
                        ],
                      ),
                    ),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(-0.6, 0.8),
                            child: StepCircle(
                              index: "2",
                              title: "الطواف",
                              onTap: () {},
                            ),
                          ),
                          // const SizedBox(height: 2),
                          const Align(
                            alignment: Alignment(-0.7, 1.5),
                            child: Text("النية"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(-0.27, 1.5),
                            child: Text("الوقوف أمام الحجر الأسود"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(-0.84, 1.5),
                            child: Text(" الإضطباع"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(-0.45, 1.5),
                            child: Text(" بداية الطواف"),
                          ),
                        ],
                      ),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.6, 2),
                            child: StepCircle(
                              index: "3",
                              title: "السعي",
                              onTap: () {},
                            ),
                          ),
                          // const SizedBox(height: 2),
                          const Align(
                            alignment: Alignment(0.65, 2),
                            child: Text("النية"),
                          ),
                          // const SizedBox(height: 3),
                          const Align(
                            alignment: Alignment(0.03, 2),
                            child: Text("   السعي بين الصفاة و المروة 7 مرات"),
                          ),
                          // const SizedBox(height: 3),
                        ],
                      ),
                    ),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(-0.6, 2),
                            child: StepCircle(
                              index: "4",
                              title: "التحلل",
                              onTap: () {},
                            ),
                          ),
                          // const SizedBox(height: 2),
                          const Align(
                            alignment: Alignment(-0.35, 2),
                            child: Text("حلق كامل أو حلق تقصير",
                                style: TextStyle(fontSize: 12)),
                          ),
                          const Align(
                            alignment: Alignment(-0.4, 2),
                            child: Text("التحلل من الاحرام ",
                                style: TextStyle(fontSize: 12)),
                          ),
                          // const SizedBox(height: 3),
                        ],
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

  // void Function()? onPressed;

  // void showDialog(onPressed) {
  //   Get.defaultDialog(
  //     backgroundColor:
  //         Colors.transparent, // Make the dialog background transparent
  //     // barrierColor: Colors.black.withOpacity(0.5), // Optional: Adjust the opacity of the barrier color
  //     title: "Choose an Option",
  //     content: Material(
  //       color: Colors.transparent, // Make the Material widget transparent
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           TextButton(
  //             onPressed: () {
  //               onPressed;
  //               Get.back(); // Close the dialog
  //             },
  //             child: Text("Toggle isDoneIhram"),
  //           ),
  //           // Add more buttons as needed
  //         ],
  //       ),
  //     ),
  //     confirm: TextButton(
  //       onPressed: () {
  //         Get.back(); // Close the dialog
  //       },
  //       child: Text("Close"),
  //     ),
  //   );
  // }
}
