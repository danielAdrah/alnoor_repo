import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../theme.dart';

class CustomPinput extends StatelessWidget {
  void Function(String)? onDone;
   CustomPinput({super.key,required this.onDone});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      pinBoxBorderWidth: 1,
      // pinBoxColor: TColor.primary,
      pinBoxRadius: 30,
      defaultBorderColor: TColor.primary,
      onDone: onDone,
    );
  }
}
