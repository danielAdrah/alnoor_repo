import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_app_bar.dart';
import '../../theme.dart';

class SupportChat extends StatefulWidget {
  const SupportChat({super.key});

  @override
  State<SupportChat> createState() => _SupportChatState();
}

class _SupportChatState extends State<SupportChat> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset("assets/img/white_arrowBack.png"))
        ],
        backgroundColor: TColor.primary,
        title: Text(
          "الدعم",
          style: TextStyle(color: TColor.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: media.width * 0.3,
                  decoration: const BoxDecoration(color: TColor.primary),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                )
              ],
            ),
            Positioned(
                top: 90,
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
                )),
          ],
        ),
      ),
    );
  }
}
