// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class StepButton extends StatelessWidget {
  const StepButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 7, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: TColor.primary)),
        child: Text(
          title,
          style: TextStyle(color: TColor.primary),
        ),
      ),
    );
  }
}
