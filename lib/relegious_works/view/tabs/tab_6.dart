import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../comon_widgets/relegious_list_tile.dart';

class Tab6 extends StatefulWidget {
  const Tab6({super.key});

  @override
  State<Tab6> createState() => _Tab6State();
}

//النية
class _Tab6State extends State<Tab6> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return FadeInRightBig(
            delay: Duration(milliseconds: 700),
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
