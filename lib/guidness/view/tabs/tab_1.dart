import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../comon_widgets/relegious_list_tile.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

//التحلل
class _Tab1State extends State<Tab1> {
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
              date: "the date ",
            ),
          );
        });
  }
}
