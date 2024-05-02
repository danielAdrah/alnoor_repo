import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CustomDropSearch extends StatelessWidget {
  List<String> items;
  final String hintText;
  CustomDropSearch({super.key, required this.items, required this.hintText});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(
            right: media.width * 0.05, left: media.width * 0.05, bottom: 20),
        child: SizedBox(
          // height: 50,
          child: DropdownSearch<String>(
            items: items,
            popupProps: PopupProps.menu(
              itemBuilder: (context, item, isSelected) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(
                      item,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              menuProps: MenuProps(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              // baseStyle: TextStyle(color: Colors.red),
              dropdownSearchDecoration: InputDecoration(
                label: Text(
                  hintText,
                  style: TextStyle(color: Colors.black.withOpacity(0.3)),
                ),
                border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),borderSide: BorderSide(color: TColor.primary)),
                // suffix: Text("dfdfdf"),
              ),
            ),
          ),
        ));
  }
}
