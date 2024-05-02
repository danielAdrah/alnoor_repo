import 'package:flutter/material.dart';

import '../../../comon_widgets/relegious_list_tile.dart';

class Tab5 extends StatefulWidget {
  const Tab5({super.key});

  @override
  State<Tab5> createState() => _Tab5State();
}
//الاحرام
class _Tab5State extends State<Tab5> {
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
