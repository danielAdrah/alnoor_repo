import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/guidnace/view/tabs/tab_1.dart';
import 'package:elnoor_haj/guidnace/view/tabs/tab_2.dart';
import 'package:elnoor_haj/guidnace/view/tabs/tab_3.dart';
import 'package:elnoor_haj/guidnace/view/tabs/tab_4.dart';
import 'package:elnoor_haj/guidnace/view/tabs/tab_5.dart';
import 'package:elnoor_haj/guidnace/view/tabs/tab_6.dart';
import 'package:flutter/material.dart';

import '../../comon_widgets/custom_app_bar.dart';
import '../../comon_widgets/relegious_list_tile.dart';
import '../../comon_widgets/tab_bar_label.dart';
import '../../theme.dart';

class RelegiousGuidness extends StatefulWidget {
  const RelegiousGuidness({super.key});

  @override
  State<RelegiousGuidness> createState() => _RelegiousGuidnessState();
}

class _RelegiousGuidnessState extends State<RelegiousGuidness> {
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
                  delay: Duration(milliseconds: 800),
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
                    Tab1(category: "التحلل"),
                    Tab2(category: "الاضطباع"),
                    Tab3(category: "السعي"),
                    Tab4(category: "الطواف"),
                    Tab5(category: "الإحرام"),
                    Tab6(category: "النية"),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
