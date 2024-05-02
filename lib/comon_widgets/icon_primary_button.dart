import 'package:flutter/material.dart';

import '../theme.dart';

class IconPrimaryButton extends StatelessWidget {
  void Function()? onTap;
  final String text;
  final IconData icon;
  IconPrimaryButton(
      {super.key, required this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: TColor.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: media.width / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Icon(
              icon,
              color: TColor.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
