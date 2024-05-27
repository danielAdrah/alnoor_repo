import 'package:flutter/material.dart';

import '../theme.dart';

class StepCircle extends StatelessWidget {
  String index;
  String title;
  Function()? onTap;
  Color borderColor;
  Color color;
  Color textColor;
  StepCircle({
    super.key,
    required this.index,
    required this.title,
    required this.onTap,
    required this.color,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: TColor.primary, blurRadius: 3)],
                border: Border.all(color: borderColor)),
            child: Center(
                child: Text(
              index,
              style: TextStyle(color: textColor),
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
