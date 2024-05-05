import 'package:flutter/material.dart';

import '../../theme.dart';

class SubTitle extends StatelessWidget {
  String text;
  SubTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text),
        const SizedBox(width: 3),
        Container(
          height: 8,
          width: 8,
          decoration:
              BoxDecoration(color: TColor.primary, shape: BoxShape.circle),
        ),
      ],
    );
  }
}
