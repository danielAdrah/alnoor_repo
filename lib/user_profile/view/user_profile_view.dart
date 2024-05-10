// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../comon_widgets/custom_app_bar2.dart';
import '../../comon_widgets/profile_tab_button.dart';
import '../../theme.dart';
import '../../widgets/profile_tab_1.dart';
import '../../widgets/profile_tab_2.dart';
import '../controller/profile_controller.dart';
import '../model/user_info_model.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool isTurn = true;
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: media.width * 0.6,
                  decoration: const BoxDecoration(color: TColor.primary),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomAppBar2(),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 170,
              left: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: media.width * 1.68,
                width: media.width * 0.8,
                child: FutureBuilder<UserInfoModel>(
                  future: controller.fetchPilgremInfo(),
                  builder: (context, snapshot) {
                    UserInfoModel? data = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: TColor.primary,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 80),
                            FadeInLeft(
                              curve: Curves.linear,
                              delay: Duration(milliseconds: 500),
                              child: Text(
                                //ddfdfd
                                "${data!.firstName}  ${data.fatherName} ${data.lastName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: media.width * 0.05),
                              ),
                            ),
                            const SizedBox(height: 10),
                            FadeInRight(
                              // ignore: prefer_const_constructors
                              delay: Duration(milliseconds: 500),
                              curve: Curves.linear,
                              child: Text(
                                "${data.phonenumber}",
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: media.width * 0.04),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // if (data.active)
                            //   ZoomIn(
                            //     delay: Duration(milliseconds: 500),
                            //     curve: Curves.decelerate,
                            //     child: InkWell(
                            //       onTap: () {},
                            //       child: Container(
                            //         padding: const EdgeInsets.symmetric(
                            //             vertical: 2, horizontal: 30),
                            //         decoration: BoxDecoration(
                            //             color: Colors.black12,
                            //             borderRadius:
                            //                 BorderRadius.circular(25)),
                            //         child: const Text(
                            //           "مفعل",
                            //           style: TextStyle(
                            //               color: Colors.green,
                            //               fontSize: 20,
                            //               fontWeight: FontWeight.w300),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // if (!data.active)
                            //   ZoomIn(
                            //     delay: Duration(milliseconds: 500),
                            //     curve: Curves.decelerate,
                            //     child: InkWell(
                            //       onTap: () {},
                            //       child: Container(
                            //         padding: const EdgeInsets.symmetric(
                            //             vertical: 2, horizontal: 30),
                            //         decoration: BoxDecoration(
                            //             color: Colors.black12,
                            //             borderRadius:
                            //                 BorderRadius.circular(25)),
                            //         child: const Text(
                            //           "غير مفعل",
                            //           style: TextStyle(
                            //               color: Colors.red,
                            //               fontSize: 20,
                            //               fontWeight: FontWeight.w300),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FadeInLeft(
                                  delay: Duration(milliseconds: 650),
                                  curve: Curves.linear,
                                  child: ProfileTabButton(
                                    title: "تفاصيل الرحلة",
                                    isActive: !isTurn,
                                    onpressed: () {
                                      setState(() {
                                        isTurn = !isTurn;
                                      });
                                    },
                                  ),
                                ),
                                FadeInRight(
                                  curve: Curves.linear,
                                  delay: Duration(milliseconds: 500),
                                  child: ProfileTabButton(
                                    title: " معلومات السكن",
                                    isActive: isTurn,
                                    onpressed: () {
                                      setState(() {
                                        isTurn = !isTurn;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            if (isTurn)
                              FadeInUpBig(
                                  delay: Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 20,
                                          bottom: 25,
                                          right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                TColor.black.withOpacity(0.1),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${data.hotel}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: TColor.primary,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: TColor.primary,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: TColor.primary,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Text("${data.hotelAddress}"),
                                                  Icon(
                                                    Icons.location_on,
                                                    color: TColor.primary,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text("${data.roomNum}"
                                                      .toString()),
                                                  Icon(
                                                    Icons.roofing_outlined,
                                                    color: TColor.primary,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: TColor.black
                                                        .withOpacity(0.1)),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: CircleAvatar(
                                              backgroundColor: TColor.white,
                                              child: const Icon(
                                                Icons.house_outlined,
                                                color: TColor.primary,
                                              ),
                                              // backgroundImage:
                                              //     AssetImage("assets/img/hotel.png"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            if (!isTurn)
                              FadeInUpBig(
                                  delay: Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 20,
                                          bottom: 30,
                                          right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                TColor.black.withOpacity(0.1),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "التاريخ",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 20),
                                                  ),
                                                  //here will be the date of the trape from the back
                                                  Text("${data.flightDate}"
                                                      .toString()),
                                                ],
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Image(
                                                  image: NetworkImage(
                                                    "${data.companyLogo}",
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "رقم الرحلة",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 20),
                                                  ),
                                                  //here will be the date of the trape from the back
                                                  Text("${data.flightNum}"
                                                      .toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Divider(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "${data.fromCity}",
                                                    style: TextStyle(
                                                        color: TColor.primary,
                                                        fontSize: 22),
                                                  ),
                                                  Text(
                                                    "المغادرة",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 19),
                                                  ),
                                                  Text("${data.departure}"
                                                      .substring(0, 10)),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .connecting_airports_rounded,
                                                    color: TColor.primary,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    "وقت الرحلة",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 20),
                                                  ),
                                                  Text("${data.duration}"
                                                      .toString()),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "${data.toCity}",
                                                    style: TextStyle(
                                                        color: TColor.primary,
                                                        fontSize: 22),
                                                  ),
                                                  Text(
                                                    "الوصول",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 19),
                                                  ),
                                                  Text("${data.arrival}"
                                                      .substring(0, 10)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Divider(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "رقم البوابة",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 19),
                                                  ),
                                                  Text("${data.gateNum}"),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    " وقت الصعود",
                                                    style: TextStyle(
                                                        color: TColor.black
                                                            .withOpacity(0.4),
                                                        fontSize: 19),
                                                  ),
                                                  Text("${data.boradingTime}"
                                                      .toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Divider(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (data.status)
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 2,
                                                        horizontal: 15),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black12,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Text(
                                                      "في الموعد",
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                ),
                                              // if (!data.status)
                                              //   InkWell(
                                              //     onTap: () {},
                                              //     child: Container(
                                              //       padding: const EdgeInsets
                                              //           .symmetric(
                                              //           vertical: 2,
                                              //           horizontal: 15),
                                              //       decoration: BoxDecoration(
                                              //           color: Colors.black12,
                                              //           borderRadius:
                                              //               BorderRadius
                                              //                   .circular(25)),
                                              //       child: const Text(
                                              //         " متأخر",
                                              //         style: TextStyle(
                                              //             color: Colors.red,
                                              //             fontSize: 15,
                                              //             fontWeight:
                                              //                 FontWeight.w300),
                                              //       ),
                                              //     ),
                                              //   ),
                                              Text(
                                                "  الحالة",
                                                style: TextStyle(
                                                    color: TColor.black
                                                        .withOpacity(0.4),
                                                    fontSize: 19),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 130,
              child: ZoomIn(
                delay: Duration(milliseconds: 600),
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: AssetImage("assets/img/bg.png"),
                  // NetworkImage("${controller.pilgrimInfoo!.image}"),
                ),
              ),
            ),
            Positioned(
              top: 190,
              right: 131,
              child: ZoomIn(
                delay: Duration(milliseconds: 500),
                child: InkWell(
                  onTap: () {},
                  // controller.uploadImage,
                  child: const CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: TColor.primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  controller.imagePath.value == null
//                       ? AssetImage("assets/img/bigAvatar.png")
//                           as ImageProvider<Object>?
//                       : FileImage(File(controller.imagePath.value!))
//                           as ImageProvider<Object>?,