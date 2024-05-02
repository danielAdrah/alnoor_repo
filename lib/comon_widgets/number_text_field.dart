import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../theme.dart';

class NumberTextField extends StatelessWidget {
  String labelText;
  void Function(PhoneNumber)? onChanged;
  NumberTextField(
      {super.key, required this.labelText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          right: media.width * 0.05, left: media.width * 0.05, bottom: 20),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Expanded(
              child: IntlPhoneField(

                onChanged: onChanged,
                dropdownIconPosition: IconPosition.leading,
                textAlign: TextAlign.right,
                initialCountryCode: "+213",
                decoration: InputDecoration(
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: TColor.primary),
                  ),
                  hintText: labelText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(30)),
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
            ),
            // Spacer()
          ],
        ),
      ),
    );
  }
}
