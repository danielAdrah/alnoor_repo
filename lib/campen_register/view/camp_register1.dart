import 'package:elnoor_haj/comon_widgets/icon_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../comon_widgets/custom_drop_search.dart';
import '../../comon_widgets/custom_text_field.dart';
import '../../comon_widgets/number_text_field.dart';
import '../../theme.dart';

class CampRegister1 extends StatefulWidget {
  final PageController controller;

  CampRegister1({super.key, required this.controller});

  @override
  State<CampRegister1> createState() => _CampRegister1State();
}

class _CampRegister1State extends State<CampRegister1> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController grandName = TextEditingController();
  final TextEditingController familyName = TextEditingController();
  final TextEditingController idNumber = TextEditingController();
  final TextEditingController date = TextEditingController();
  bool areFieldsFilled() {
    return firstName.text.isNotEmpty &&
        fatherName.text.isNotEmpty &&
        grandName.text.isNotEmpty &&
        familyName.text.isNotEmpty &&
        idNumber.text.isNotEmpty &&
        date.text.isNotEmpty;
  }

  List<String> titles = [
    "الاسم الأول",
    "اسم الأب",
    "الاسم الجد",
    " العائلة",
    // "رقم الجوال",
    " الإيميل",
    "رقم الهوية",
    "تاريخ ميلادك",
  ];

  List<String> hintTitles = [
    " ادخل اسمك الأول",
    " ادخل اسم الأب",
    "ادخل اسم الجد ",
    " ادخل اسم عائلتك",
    // " ادخل رقم جوالك",
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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
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
            //   "معلومات الحاج الشخصية",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // )),
            // const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: ((context, index) {
                if (index == 4) {
                  return FadeInLeft(
                    delay: Duration(milliseconds: 700),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.05),
                          child: const Text("رقم الجوال"),
                        ),
                        const SizedBox(height: 11),
                        NumberTextField(
                          labelText: "ادخل رقم جوالك",
                          onChanged: (phoneNumber) {},
                        ),
                      ],
                    ),
                  );
                }
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
                      CustomTextField(
                          txtController: index == 0
                              ? firstName
                              : index == 1
                                  ? fatherName
                                  : index == 2
                                      ? grandName
                                      : index == 3
                                          ? familyName
                                          : index == 5
                                              ? idNumber
                                              : index == 6
                                                  ? date
                                                  : TextEditingController(),
                          hintText: hintTitles[index],
                          keyboardType: index == 0 ||
                                  index == 1 ||
                                  index == 2 ||
                                  index == 3
                              ? TextInputType.name
                              : index == 4 || index == 6
                                  ? TextInputType.phone
                                  : index == 7
                                      ? TextInputType.number
                                      : TextInputType.emailAddress),
                    ],
                  ),
                );
              }),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, inx) {
                  List<String> items;
                  if (inx == 0) {
                    items = gendre;
                  } else if (inx == 1) {
                    items = trips;
                  } else {
                    items = [];
                  }
                  String text;
                  if (inx == 0) {
                    text = "اختر الجنس";
                  } else if (inx == 1) {
                    text = "اختر رحلتك";
                  } else {
                    text = "";
                  }
                  return FadeInLeft(
                      delay: const Duration(milliseconds: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: media.width * 0.05),
                            child: Text(dropHint[inx]),
                          ),
                          const SizedBox(height: 8),
                          CustomDropSearch(items: items, hintText: text),
                        ],
                      ));
                }),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: media.width * 0.04),
              child: FadeInLeft(
                delay: const Duration(milliseconds: 500),
                child: IconPrimaryButton(
                  onTap: () {
                    if (areFieldsFilled()) {
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
