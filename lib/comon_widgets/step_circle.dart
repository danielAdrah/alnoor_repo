import 'package:flutter/material.dart';

import '../theme.dart';

class StepCircle extends StatelessWidget {
  String index;
  String title;
  Function()? onTap;
  StepCircle(
      {super.key,
      required this.index,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: TColor.primary,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: TColor.primary, blurRadius: 3)]),
            child: Center(
                child: Text(
              index,
              style: TextStyle(color: TColor.white),
            )),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(color: TColor.primary, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
