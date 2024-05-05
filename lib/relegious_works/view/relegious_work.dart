import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../comon_widgets/custom_app_bar.dart';
import '../../comon_widgets/relegious_list_tile.dart';
import '../../comon_widgets/tab_bar_label.dart';
import '../../theme.dart';
import 'tabs/tab_1.dart';
import 'tabs/tab_2.dart';
import 'tabs/tab_3.dart';
import 'tabs/tab_4.dart';
import 'tabs/tab_5.dart';
import 'tabs/tab_6.dart';

class RelegiousWork extends StatefulWidget {
  const RelegiousWork({super.key});

  @override
  State<RelegiousWork> createState() => _RelegiousWorkState();
}

class _RelegiousWorkState extends State<RelegiousWork> {
  bool isTurn = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 5,
        length: 6,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomAppBar(title: "", name: ""),
                ),
                ZoomIn(
                  delay: Duration(milliseconds: 700),
                  curve: Curves.easeInCirc,
                  child: const TabBar(
                      labelColor: TColor.primary,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: TColor.primary,
                      isScrollable: true,
                      tabs: [
                        Tab(
                          child: Text("التحلل"),
                        ),
                        Tab(
                          child: Text("الاضطباع"),
                        ),
                        Tab(
                          child: Text("السعي"),
                        ),
                        Tab(
                          child: Text("الطواف"),
                        ),
                        Tab(
                          child: Text("الإحرام"),
                        ),
                        Tab(
                          child: Text("النية"),
                        ),
                      ]),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: TabBarView(children: [
                    Tab1(),
                    Tab2(),
                    Tab3(),
                    Tab4(),
                    Tab5(),
                    Tab6()
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
