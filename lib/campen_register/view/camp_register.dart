import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'camp_register1.dart';
import 'camp_register2.dart';
import 'camp_register3.dart';
import 'camp_register4.dart';

class CampRegister extends StatefulWidget {
  const CampRegister({super.key});

  @override
  State<CampRegister> createState() => _CampRegisterState();
}

class _CampRegisterState extends State<CampRegister> {
  PageController _controller = PageController();

  List<String> titles = [
    "الاسم الأول",
    "اسم الأب",
    "الاسم الجد",
    " العائلة",
    "رقم الجوال",
    " الإيميل",
    "رقم الهوية",
    "تاريخ ميلادك",
  ];
  List<String> hintTitles = [
    " ادخل اسمك الأول",
    " ادخل اسم الأب",
    "ادخل اسم الجد ",
    " ادخل اسم عائلتك",
    " ادخل رقم جوالك",
    "  myemail@gmail.com",
    " ادخل رقم هويتك",
    " ادخل تاريخ ميلادك",
  ];
  List<String> gendre = [
    "ذكر",
    "انثى",
  ];
  List<String> trips = [];
  List<String> dropHint = ["الجنس", "خيارات الرحلة"];
  List<Widget> pages = [];
  bool isLastPage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      CampRegister1(controller: _controller),
      CampRegister2(controller: _controller),
      CampRegister3(controller: _controller),
      CampRegister4(controller: _controller),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                //that means we are in the last page
                isLastPage = (index == 4);
              });
            },
            itemCount: pages.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  Expanded(
                    child: pages[index],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
// Container(
//             alignment: Alignment(0, -0.22),
//             child: SmoothPageIndicator(
//               controller: _controller,
//               count: pages.length,
//               effect: const ExpandingDotsEffect(activeDotColor: TColor.primary),
//             ),
//           ),