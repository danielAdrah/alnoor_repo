// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../comon_widgets/custom_app_bar.dart';
import '../../comon_widgets/step_button.dart';
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
  Color borderColor = TColor.primary;
  Color color = Colors.green;
  Color textColor = TColor.primary;
  MainScreenController controller =
      Get.put(MainScreenController(api: DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                child: GetBuilder<MainScreenController>(
                    init: MainScreenController(api: DioConsumer(dio: Dio())),
                    builder: (controller) {
                      return ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.fetchPrayerTime();
                                  },
                                  child: Text(
                                    "الضهر",
                                    style: TextStyle(
                                        color: TColor.white, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "${controller.times?.timings.fajr}",
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
                      );
                    }),
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
            child: FutureBuilder(
                future: controller.fetchStep(),
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
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        if (index == 0) {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment(0.6, 2),
                                child: StepCircle(
                                  textColor: textColor,
                                  color: color,
                                  borderColor: borderColor,
                                  index: "1",
                                  title: data.name,
                                  onTap: () {
                                    setState(() {
                                      textColor = TColor.white;
                                      color = TColor.primary;
                                      borderColor = TColor.primary;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: media.width * 0.4,
                                              width: media.width * 0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          media.width * 0.07),
                                                  Text(
                                                    data.note,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  SizedBox(height: 10),
                                                  StepButton(
                                                      title: "تم الانتهاء"),
                                                ],
                                              ),
                                            ),
                                          );
                                        }));
                                  },
                                ),
                              ),
                              // const SizedBox(height: 3),
                              ...data.secondarySteps.asMap().entries.map((e) {
                                int secondaryIndex = e.key;
                                var secondaryStep = e.value;
                                List<Widget> secondaryWidgets = [
                                  Align(
                                    alignment: secondaryIndex == 0
                                        ? Alignment(0.44, 2)
                                        : secondaryIndex == 1
                                            ? Alignment(0.72, 2)
                                            : Alignment(0.44, 2),
                                    child: Text(secondaryStep.name),
                                  )
                                ];
                                if (secondaryIndex !=
                                    data.secondarySteps.length - 1) {
                                  secondaryWidgets.add(SizedBox(height: 2));
                                }
                                return Column(children: secondaryWidgets);
                              })
                            ],
                          );
                        }
                        if (index == 1) {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment(-0.6, 0.8),
                                child: StepCircle(
                                  textColor: TColor.primary,
                                  color: TColor.white,
                                  borderColor: TColor.primary,
                                  index: "2",
                                  title: data.name,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: media.width * 0.4,
                                              width: media.width * 0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          media.width * 0.07),
                                                  Text(
                                                    data.note,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  SizedBox(height: 10),
                                                  StepButton(
                                                      title: "تم الانتهاء"),
                                                ],
                                              ),
                                            ),
                                          );
                                        }));
                                  },
                                ),
                              ),
                              ...data.secondarySteps.asMap().entries.map((e) {
                                int secondaryIndex = e.key;
                                var secondaryStep = e.value;
                                List<Widget> secondaryWidgets = [
                                  Align(
                                    alignment: secondaryIndex == 0
                                        ? Alignment(-0.8, 1.5)
                                        : secondaryIndex == 1
                                            ? Alignment(-0.27, 1.5)
                                            : Alignment(-0.8, 1.5),
                                    child: Text(secondaryStep.name),
                                  )
                                ];
                                if (secondaryIndex !=
                                    data.secondarySteps.length - 1) {
                                  secondaryWidgets.add(SizedBox(height: 2));
                                }
                                return Column(children: secondaryWidgets);
                              })

                              // const Align(
                              //   alignment: Alignment(-0.7, 1.5),
                              //   child: Text("النية"),
                              // ),
                              // // const SizedBox(height: 3),
                              // const Align(
                              //   alignment: Alignment(-0.27, 1.5),
                              //   child: Text("الوقوف أمام الحجر الأسود"),
                              // ),
                              // // const SizedBox(height: 3),
                              // const Align(
                              //   alignment: Alignment(-0.84, 1.5),
                              //   child: Text(" الإضطباع"),
                              // ),
                              // // const SizedBox(height: 3),
                              // const Align(
                              //   alignment: Alignment(-0.45, 1.5),
                              //   child: Text(" بداية الطواف"),
                              // ),
                            ],
                          );
                        }
                        if (index == 2) {
                          return Column(
                            children: [
                              Align(
                                alignment: const Alignment(0.6, 2),
                                child: StepCircle(
                                  textColor: TColor.primary,
                                  color: TColor.white,
                                  borderColor: TColor.primary,
                                  index: "3",
                                  title: data.name,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: media.width * 0.4,
                                              width: media.width * 0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          media.width * 0.07),
                                                  Text(
                                                    data.note,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  SizedBox(height: 10),
                                                  StepButton(
                                                      title: "تم الانتهاء"),
                                                ],
                                              ),
                                            ),
                                          );
                                        }));
                                  },
                                ),
                              ),
                              ...data.secondarySteps.asMap().entries.map((e) {
                                int secondaryIndex = e.key;
                                var secondaryStep = e.value;
                                List<Widget> secondaryWidgets = [
                                  Align(
                                    alignment: secondaryIndex == 0
                                        ? Alignment(0.4, 1.5)
                                        : secondaryIndex == 1
                                            ? Alignment(-0.27, 1.5)
                                            : Alignment(0.4, 1.5),
                                    child: Text(secondaryStep.name),
                                  )
                                ];
                                if (secondaryIndex !=
                                    data.secondarySteps.length - 1) {
                                  secondaryWidgets.add(SizedBox(height: 2));
                                }
                                return Column(children: secondaryWidgets);
                              })
                              // const Align(
                              //   alignment: Alignment(0.65, 2),
                              //   child: Text("النية"),
                              // ),
                              // // const SizedBox(height: 3),
                              // const Align(
                              //   alignment: Alignment(0.03, 2),
                              //   child:
                              //       Text("   السعي بين الصفاة و المروة 7 مرات"),
                              // ),
                              // const SizedBox(height: 3),
                            ],
                          );
                        }
                        if (index == 3) {
                          return Column(
                            children: [
                              Align(
                                alignment: const Alignment(-0.6, 2),
                                child: StepCircle(
                                  textColor: TColor.primary,
                                  color: TColor.white,
                                  borderColor: TColor.primary,
                                  index: "4",
                                  title: data.name,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: media.width * 0.4,
                                              width: media.width * 0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          media.width * 0.07),
                                                  Text(
                                                    data.note,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  SizedBox(height: 10),
                                                  StepButton(
                                                      title: "تم الانتهاء"),
                                                ],
                                              ),
                                            ),
                                          );
                                        }));
                                  },
                                ),
                              ),
                              ...data.secondarySteps.asMap().entries.map((e) {
                                int secondaryIndex = e.key;
                                var secondaryStep = e.value;
                                List<Widget> secondaryWidgets = [
                                  Align(
                                    alignment: secondaryIndex == 0
                                        ? Alignment(-0.75, 1.5)
                                        : secondaryIndex == 1
                                            ? Alignment(-0.48, 1.5)
                                            : Alignment(-0.75, 1.5),
                                    child: Text(secondaryStep.name),
                                  )
                                ];
                                if (secondaryIndex !=
                                    data.secondarySteps.length - 1) {
                                  secondaryWidgets.add(SizedBox(height: 2));
                                }
                                return Column(children: secondaryWidgets);
                              })
                              // const Align(
                              //   alignment: Alignment(-0.35, 2),
                              //   child: Text("حلق كامل أو حلق تقصير",
                              //       style: TextStyle(fontSize: 12)),
                              // ),
                              // const Align(
                              //   alignment: Alignment(-0.4, 2),
                              //   child: Text("التحلل من الاحرام ",
                              //       style: TextStyle(fontSize: 12)),
                              // ),
                              // const SizedBox(height: 3),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            Align(
                              alignment: Alignment(0.6, -5),
                              child: StepCircle(
                                textColor: TColor.primary,
                                color: TColor.white,
                                borderColor: TColor.primary,
                                index: "1",
                                title: data.name,
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: media.width * 0.4,
                                            width: media.width * 0.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(70)),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height: media.width * 0.07),
                                                Text(
                                                  data.note,
                                                  textAlign: TextAlign.end,
                                                ),
                                                SizedBox(height: 10),
                                                StepButton(
                                                    title: "تم الانتهاء"),
                                              ],
                                            ),
                                          ),
                                        );
                                      }));
                                },
                              ),
                            ),
                            // const SizedBox(height: 3),
                            ...data.secondarySteps.asMap().entries.map((e) {
                              int secondaryIndex = e.key;
                              var secondaryStep = e.value;
                              List<Widget> secondaryWidgets = [
                                Align(
                                  alignment: secondaryIndex == 0
                                      ? Alignment(0.44, 2)
                                      : secondaryIndex == 1
                                          ? Alignment(0.72, 2)
                                          : Alignment(0.44, 2),
                                  child: Text(secondaryStep.name),
                                )
                              ];
                              if (secondaryIndex !=
                                  data.secondarySteps.length - 1) {
                                secondaryWidgets.add(SizedBox(height: 2));
                              }
                              return Column(children: secondaryWidgets);
                            })
                          ],
                        );
                      },
                    );
                  }
                }),
          ),
        ]),
      ),
    ));
  }
}

// FadeInLeft(
                    //   delay: const Duration(milliseconds: 700),
                    //   child: Column(
                    //     children: [
                    //       Align(
                    //         alignment: const Alignment(-0.6, 0.8),
                    //         child: StepCircle(
                    //           index: "2",
                    //           title: "الطواف",
                    //           onTap: () {},
                    //         ),
                    //       ),
                    //       // const SizedBox(height: 2),
                          // const Align(
                          //   alignment: Alignment(-0.7, 1.5),
                          //   child: Text("النية"),
                          // ),
                          // // const SizedBox(height: 3),
                          // const Align(
                          //   alignment: Alignment(-0.27, 1.5),
                          //   child: Text("الوقوف أمام الحجر الأسود"),
                          // ),
                          // // const SizedBox(height: 3),
                          // const Align(
                          //   alignment: Alignment(-0.84, 1.5),
                          //   child: Text(" الإضطباع"),
                          // ),
                          // // const SizedBox(height: 3),
                          // const Align(
                          //   alignment: Alignment(-0.45, 1.5),
                          //   child: Text(" بداية الطواف"),
                          // ),
                    //     ],
                    //   ),
                    // ),
                    // FadeInRight(
                    //   delay: const Duration(milliseconds: 700),
                      // child: Column(
                      //   children: [
                      //     Align(
                      //       alignment: const Alignment(0.6, 2),
                      //       child: StepCircle(
                      //         index: "3",
                      //         title: "السعي",
                      //         onTap: () {},
                      //       ),
                      //     ),
                      //     // const SizedBox(height: 2),
                      //     const Align(
                      //       alignment: Alignment(0.65, 2),
                      //       child: Text("النية"),
                      //     ),
                      //     // const SizedBox(height: 3),
                      //     const Align(
                      //       alignment: Alignment(0.03, 2),
                      //       child:
                      //           Text("   السعي بين الصفاة و المروة 7 مرات"),
                      //     ),
                      //     // const SizedBox(height: 3),
                      //   ],
                      // ),
                    // ),
                    // FadeInLeft(
                    //   delay: const Duration(milliseconds: 700),
                      // child: Column(
                      //   children: [
                      //     Align(
                      //       alignment: const Alignment(-0.6, 2),
                      //       child: StepCircle(
                      //         index: "4",
                      //         title: "التحلل",
                      //         onTap: () {},
                      //       ),
                      //     ),
                      //     // const SizedBox(height: 2),
                      //     const Align(
                      //       alignment: Alignment(-0.35, 2),
                      //       child: Text("حلق كامل أو حلق تقصير",
                      //           style: TextStyle(fontSize: 12)),
                      //     ),
                      //     const Align(
                      //       alignment: Alignment(-0.4, 2),
                      //       child: Text("التحلل من الاحرام ",
                      //           style: TextStyle(fontSize: 12)),
                      //     ),
                      //     // const SizedBox(height: 3),
                      //   ],
                      // ),
                    // ),