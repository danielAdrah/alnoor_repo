import 'package:animate_do/animate_do.dart';
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
          return ZoomIn(
            delay: Duration(milliseconds: 800),
            curve: Curves.easeIn,
            child: RelegiousListTile(
              onTap: () {},
              title: "here the header",
              subTitle: "here is the body",
              date: "the date",
            ),
          );
        });
  }
}
