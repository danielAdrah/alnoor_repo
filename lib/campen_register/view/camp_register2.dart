import 'package:elnoor_haj/comon_widgets/icon_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../comon_widgets/custom_drop_search.dart';
import '../../comon_widgets/custom_text_field.dart';
import '../../theme.dart';

class CampRegister2 extends StatefulWidget {
  final PageController controller;
  CampRegister2({super.key, required this.controller});

  @override
  State<CampRegister2> createState() => _CampRegister2State();
}

class _CampRegister2State extends State<CampRegister2> {
  final TextEditingController job = TextEditingController();
  final TextEditingController stay = TextEditingController();
  bool areGood() {
    return job.text.isNotEmpty && stay.text.isNotEmpty;
  }

  List<String> titles = [
    " الوظيفة",
    " مكان المسكن",
  ];

  List<String> hintTitles = [
    "   اكتب وظيفتك",
    "   ادخل عنوان سكنك",
  ];

  List<String> social = [
    "",
    "",
  ];

  List<String> trips = [];

  // List<String> dropHint = ["الجنس", "خيارات الرحلة"];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //     child: FadeInDown(
            //   delay: const Duration(milliseconds: 500),
            //   child: const Image(
            //     image: AssetImage("assets/img/logo.png"),
            //     height: 120,
            //     width: 120,
            //   ),
            // )),
            // Text(
            //   "التسجيل في حملة النور عام\n 1445",
            //   style: TextStyle(
            //       color: TColor.primary,
            //       fontWeight: FontWeight.bold,
            //       fontSize: media.width * 0.055),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(height: 10),
            // const Center(
            //     child: Text(
            //   "  الحالة الاجتماعية",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // )),
            // const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: ((context, index) {
                return FadeInRight(
                  delay: const Duration(milliseconds: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.05),
                        child: Text(titles[index]),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                          txtController: index == 0 ? job : stay,
                          hintText: hintTitles[index],
                          keyboardType: TextInputType.name),
                    ],
                  ),
                );
              }),
            ),
            FadeInRight(
                delay: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.05),
                      child: Text("الحالة الاجتماعية"),
                    ),
                    const SizedBox(height: 8),
                    CustomDropSearch(
                        items: social, hintText: "اختر حالتك الاجتماعية"),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: media.width * 0.04),
              child: FadeInRight(
                delay: const Duration(milliseconds: 500),
                child: IconPrimaryButton(
                  onTap: () {
                    if (areGood()) {
                      widget.controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields.')),
                      );
                    }
                  },
                  text: "التالي",
                  icon: Icons.arrow_forward,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
