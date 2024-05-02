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
          return RelegiousListTile(
            onTap: () {},
            title: "",
            subTitle: "",
            date: "",
          );
        });
  }
}
