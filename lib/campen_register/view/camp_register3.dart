import 'package:elnoor_haj/comon_widgets/icon_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../comon_widgets/custom_drop_search.dart';
import '../../comon_widgets/custom_text_field.dart';
import '../../theme.dart';

class CampRegister3 extends StatefulWidget {
  final PageController controller;

  CampRegister3({super.key, required this.controller});

  @override
  State<CampRegister3> createState() => _CampRegister3State();
}

class _CampRegister3State extends State<CampRegister3> {
  final TextEditingController goes = TextEditingController();
  bool areGood() {
    return goes.text.isNotEmpty;
  }

  List<String> titles = [
    "نوع الحجة",
    "مرجع التقليد",
    "خيارات الرحلة",
    "اخر سنة حججت فيها",
    "وسيلة الرحلة",
  ];

  List<String> dropHints = [
    "اختر نوع الحجة",
    "مرجع التقليد",
    "المدينة و مكة",
    "اختر السنة",
    "اختر و سيلة الرحلة",
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Center(
                child: FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: const Image(
                image: AssetImage("assets/img/logo.png"),
                height: 120,
                width: 120,
              ),
            )),
            Text(
              "التسجيل في حملة النور عام\n 1445",
              style: TextStyle(
                  color: TColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: media.width * 0.055),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "  معلومات الحاج الصحية",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: ((context, index) {
                return FadeInLeft(
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
                      CustomDropSearch(items: [], hintText: dropHints[index]),
                    ],
                  ),
                );
              }),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: Text("عدد الحجات"),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                      txtController: goes,
                      hintText: "اكتب عدد الحجات",
                      keyboardType: TextInputType.number),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: media.width * 0.04),
                    child: FadeInLeft(
                      delay: const Duration(milliseconds: 500),
                      child: IconPrimaryButton(
                        onTap: () {
                          if (areGood()) {
                            widget.controller.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Please fill in all fields.')),
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
          ],
        ),
      ),
    );
  }
}
