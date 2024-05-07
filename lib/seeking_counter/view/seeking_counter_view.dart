import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/theme.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../comon_widgets/custom_app_bar.dart';

class SeekingCounterView extends StatefulWidget {
  const SeekingCounterView({super.key});

  @override
  State<SeekingCounterView> createState() => _SeekingCounterViewState();
}

class _SeekingCounterViewState extends State<SeekingCounterView> {
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAppBar(
              title: "",
              name: "",
            ),
            const SizedBox(height: 40),
            FadeInDownBig(
              delay: Duration(milliseconds: 700),
              // curve: Curves.easeIn,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "$sum : عدد السعي ",
                    style: const TextStyle(
                        color: TColor.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 130),
            ZoomIn(
              delay: Duration(milliseconds: 700),
              child: Text(
                "انقر على الدائرة في كل طواف",
                style: TextStyle(
                    color: TColor.black.withOpacity(0.5), fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ZoomIn(
              delay: Duration(milliseconds: 800),
              curve: Curves.easeInOutExpo,
              child: InkWell(
                onTap: () {
                  setState(() {
                    sum++;
                  });
                },
                child: const CircleAvatar(
                  radius: 120,
                  backgroundColor: TColor.primary,
                  backgroundImage: AssetImage("assets/img/weather_rec1.png"),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
