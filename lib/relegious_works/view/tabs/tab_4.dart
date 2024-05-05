import 'package:animate_do/animate_do.dart';
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
          return ZoomIn(
            delay: Duration(milliseconds: 700),
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
