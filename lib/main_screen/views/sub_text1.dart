import 'package:dio/dio.dart';
import 'package:elnoor_haj/core/api/dio_consumer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/step_circle.dart';
import '../../theme.dart';
import '../controller/main_screen_controller.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  MainScreenController controller =
      Get.put(MainScreenController(api: DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      init: MainScreenController(api: DioConsumer(dio: Dio())),
      builder: (controller) {
        return Column(
          children: [
            Align(
              alignment: const Alignment(0.6, 2),
              child: StepCircle(
                index: "1",
                title: "",
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
        );
      },
    );
  }
}
