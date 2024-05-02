import 'package:elnoor_haj/comon_widgets/icon_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import '../../comon_widgets/custom_drop_search.dart';
import '../../comon_widgets/custom_text_field.dart';
import '../../data_received/data_received.dart';
import '../../theme.dart';

class CampRegister4 extends StatefulWidget {
  final PageController controller;

  CampRegister4({super.key, required this.controller});

  @override
  State<CampRegister4> createState() => _CampRegister4State();
}

class _CampRegister4State extends State<CampRegister4> {
  final TextEditingController detail = TextEditingController();
  bool areGood4() {
    return detail.text.isNotEmpty;
  }

  List<String> titles = [
    " فصيلة الدم",
    " هل لديك أمراض مزمنة",
    " هل تحتاج لمن يساعدك أثناء الطواف",
    "   هل تحتاج لمن يساعدك أثناء السعي",
    " هل تحتاج إلى كرسي متحرك",
  ];

  List<String> dropHints = [
    "اختر فصيلة دمك",
    "نعم",
    "نعم",
    "نعم",
    "نعم",
  ];

  List<String> bloodType = ["A+", "A-", "B+", "B-", "AB", "C+", "C-"];

  List<String> ans = ["نعم", "لا"];

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
            //   "  معلومات الحج",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // )),
            // const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: ((context, index) {
                List<String> item;
                if (index == 0) {
                  item = bloodType;
                } else {
                  item = ans;
                }
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
                      CustomDropSearch(items: item, hintText: dropHints[index]),
                    ],
                  ),
                );
              }),
            ),
            FadeInRight(
              delay: Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: Text(" يمكنك كتابة المساعدة المطلوبة"),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                      txtController: detail,
                      hintText: "اكتب ما تحتاجه هنا  ",
                      keyboardType: TextInputType.name),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: media.width * 0.04),
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      child: IconPrimaryButton(
                        onTap: () {
                          print(detail.text);
                          if (areGood4()) {
                            Get.off(DataReceived());
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
