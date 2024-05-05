import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../comon_widgets/relegious_list_tile.dart';

class Tab3 extends StatefulWidget {
  const Tab3({super.key});

  @override
  State<Tab3> createState() => _Tab3State();
}

//السعي
class _Tab3State extends State<Tab3> {
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
              title: "the header is here",
              subTitle: "the body is here",
              date: "the date",
            ),
          );
        });
  }
}
