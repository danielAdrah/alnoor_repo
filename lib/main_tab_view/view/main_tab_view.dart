// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/support_chat/views/support_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../guidnace/view/guidness_view.dart';
import '../../main_screen/views/main_screen.dart';
import '../../managment_chat/view/managment_chat.dart';
import '../../relegious_works/view/relegious_work.dart';
import '../../seeking_counter/view/seeking_counter_view.dart';
import '../../theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  final GetStorage storage = GetStorage();
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const MainScreen();
  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (serviceEnabled == false) {
      return AboutDialog(
        children: [
          Text("رجاء قم بتشغيل الموقع"),
        ],
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //here what will show if denied
      }
      if (permission == LocationPermission.deniedForever) {
        //will display if denied for ever
      }

      if (permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        var long = position.longitude;
        var alt = position.altitude;
        print("-----------------------------");
        print(long);
        print(position.latitude);
        storage.write("longitude", long);
        storage.write("altitude", alt);
        // later we need to store the longitude and latitude and send it to the api
      }
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageStorage(
            bucket: pageStorageBucket,
            child: currentTabView,
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/img/navBar.png"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 0;
                                      currentTabView = const MainScreen();
                                    });
                                  },
                                  icon: Image.asset(
                                    "assets/img/main_navBar.png",
                                    width: 55,
                                    height: 55,
                                    color: selectTab == 0
                                        ? TColor.primary
                                        : TColor.black,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 1;
                                    currentTabView = const RelegiousWork();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/relegious_navBar.png",
                                  width: 55,
                                  height: 55,
                                  color: selectTab == 1
                                      ? TColor.primary
                                      : TColor.black,
                                ),
                              ),
                              const SizedBox(
                                width: 55,
                                height: 55,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 2;
                                    currentTabView = const RelegiousGuidness();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/guid_navBar.png",
                                  width: 55,
                                  height: 55,
                                  color: selectTab == 2
                                      ? TColor.primary
                                      : TColor.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 3;
                                    currentTabView = const SeekingCounterView();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/counter_navBar.png",
                                  width: 55,
                                  height: 55,
                                  color: selectTab == 3
                                      ? TColor.primary
                                      : TColor.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _showAlertDialog(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: Image.asset(
                            "assets/img/center_navBar.png",
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var media = MediaQuery.of(context).size;

      return AlertDialog(
        content: Container(
          height: media.width * 0.4,
          width: media.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => ManagmentChat());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.3))),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(() => ManagmentChat());
                          },
                          icon: Image.asset("assets/img/chatIcon.png")),
                      const SizedBox(height: 5),
                      Text("دردشة مع الإدارة"),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SupportChat());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.3))),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(() => SupportChat());
                          },
                          icon: Image.asset("assets/img/supportIcon.png")),
                      const SizedBox(height: 5),
                      Text("دردشة مع المرشد"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
