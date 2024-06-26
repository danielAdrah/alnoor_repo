import 'package:flutter/material.dart';

import '../theme.dart';

class RelegiousListTile extends StatefulWidget {
  void Function()? onTap;
  final String title;
  final String image;
  final String subTitle;
  final DateTime date;
  RelegiousListTile(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.image});

  @override
  State<RelegiousListTile> createState() => _RelegiousListTileState();
}

class _RelegiousListTileState extends State<RelegiousListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(
          right: 5,
          // right: 20,
          // left: 20,
          // bottom: 10,
          // top: 10,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: TColor.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.subTitle,
                  style: TextStyle(
                      fontSize: 10, color: TColor.black.withOpacity(0.3)),
                ),
                Text(
                  widget.date.toString().substring(0, 11),
                  style: const TextStyle(color: TColor.primary, fontSize: 10),
                ),
              ],
            ),
            const SizedBox(width: 10),
            // here we will put the image from the api
            Expanded(child: Image(image: NetworkImage(widget.image)))
          ],
        ),
        // ListTile(
        //   onTap: () {},
        //   trailing: Image(image: AssetImage("assets/img/alqublah_mini.png")),
        //   title: Text("some text"),
        //   subtitle: Text("lower text"),
        // ),
      ),
    );
  }
}
