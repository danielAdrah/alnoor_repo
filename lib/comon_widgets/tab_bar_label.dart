import 'package:flutter/material.dart';

import '../theme.dart';

class TabBarLabel extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final bool isActive;
  const TabBarLabel(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: TColor.primary))),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? TColor.primary : TColor.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
