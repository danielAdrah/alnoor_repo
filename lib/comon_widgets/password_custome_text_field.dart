import 'package:flutter/material.dart';

import '../theme.dart';

class PasswordCustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType? keyboardType;
  bool secure;
  TextEditingController controller;

  PasswordCustomTextField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      required this.secure,
      required this.controller});

  @override
  State<PasswordCustomTextField> createState() =>
      _PasswordCustomTextFieldState();
}

class _PasswordCustomTextFieldState extends State<PasswordCustomTextField> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          right: media.width * 0.05, left: media.width * 0.05, bottom: 20),
      child: Container(
        height: 50,
        child: TextField(
          controller: widget.controller,
          obscureText: toggle,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
                icon: toggle
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off)),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
            hintTextDirection: TextDirection.rtl,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide()),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: TColor.primary),
            ),
          ),
        ),
      ),
    );
  }
}
