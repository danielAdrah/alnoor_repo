// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:elnoor_haj/seeking_counter/view/seeking_counter_view.dart';
import 'package:elnoor_haj/seeking_counter/view/seeking_counter_view2.dart';
import 'package:flutter/material.dart';

import '../../comon_widgets/custom_app_bar.dart';
import '../../theme.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
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
                      // isScrollable: true,
                      tabs: [
                        Tab(
                          child: Text("عداد الطواف"),
                        ),
                        Tab(
                          child: Text("عداد السعي"),
                        ),
                      ]),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: TabBarView(
                      children: [SeekingCounterView(), SeekingCounterView2(),]),
                ),
              ],
            ),
          ),
        ));
  }
}
