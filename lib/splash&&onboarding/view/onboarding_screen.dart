import 'package:elnoor_haj/comon_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../campen_register/view/camp_register.dart';
import '../../comon_widgets/icon_primary_button.dart';
import '../../theme.dart';
import '../onboarding_model/onboarding_design.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView.builder(
              itemCount: pages.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  //that means we are in the last page
                  isLastPage = (index == 2);
                });
              },
              itemBuilder: (content, index) {
                return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/bg.png"),
                          alignment: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      const SizedBox(height: 120),
                      SizedBox(
                        width: 260,
                        height: 260,
                        child: FadeInDown(
                            delay: Duration(milliseconds: 500),
                            child:
                                Image(image: AssetImage(pages[index].image!))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        pages[index].title!,
                        style: const TextStyle(
                            color: TColor.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          pages[index].body!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      const SizedBox(height: 100),
                      !isLastPage
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: media.width * 0.03),
                              child: FadeInLeft(
                                delay: Duration(milliseconds: 600),
                                child: IconPrimaryButton(
                                  icon: Icons.arrow_forward,
                                  onTap: () {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  },
                                  text: "التالي",
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: media.width * 0.03),
                              child: FadeInUp(
                                delay: Duration(milliseconds: 600),
                                child: IconPrimaryButton(
                                  onTap: () {
                                    Get.to(CampRegister());
                                  },
                                  text: "بدء",
                                  icon: Icons.arrow_forward,
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
            Container(
              alignment: const Alignment(0, 0.38),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect:
                    const ExpandingDotsEffect(activeDotColor: TColor.primary),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text("تخطي")),
                IconButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    icon: const Icon(Icons.arrow_forward))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
