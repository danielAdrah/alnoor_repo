import 'package:flutter/material.dart';

import '../../../comon_widgets/relegious_list_tile.dart';

class Tab4 extends StatefulWidget {
  const Tab4({super.key});

  @override
  State<Tab4> createState() => _Tab4State();
}
//الطواف
class _Tab4State extends State<Tab4> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return RelegiousListTile(
            onTap: () {},
            title: "",
            subTitle: "",
            date: "",
          );
        });
  }
}
