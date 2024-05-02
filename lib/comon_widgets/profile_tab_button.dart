import 'package:flutter/material.dart';

import '../theme.dart';

class ProfileTabButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final bool isActive;
  const ProfileTabButton(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? TColor.primary : TColor.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
