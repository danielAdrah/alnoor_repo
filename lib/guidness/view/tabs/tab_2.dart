import 'package:flutter/material.dart';

import '../../../comon_widgets/relegious_list_tile.dart';

class Tab2 extends StatefulWidget {
  const Tab2({super.key});

  @override
  State<Tab2> createState() => _Tab2State();
}
//الاضطباع
class _Tab2State extends State<Tab2> {
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
