import 'package:flutter/material.dart';
import '../../comon_widgets/custom_app_bar.dart';
import '../../theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                              style:
                                  TextStyle(color: TColor.white, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "12:30",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "بتوقيت مكة المكرمة",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 14),
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
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "خط السير",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
