import 'package:bloc_task/constants/helpers.dart';
import 'package:bloc_task/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/on_boarding_item.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageViewController = PageController();

    final List<Map<String, String>> pagesData = [
      {
        "image": "assets/images/ob1.svg",
        "title": "Explore the world easily",
        "text": 'desire',
      },
      {
        "image": "assets/images/ob2.svg",
        "title": "Reach the unknown spot",
        "text": 'destination',
      },
      {
        "image": "assets/images/ob3.svg",
        "title": "Make connects with explora",
        "text": 'dream trip',
      },
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Helpers.height * 0.74,
            child: PageView(
              controller: pageViewController,
              children: pagesData
                  .map((item) => OnBoardingItem(
                      imagePath: item["image"]!,
                      primString: item["title"]!,
                      secString: item["text"]!))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  onDotClicked: (index) {
                    pageViewController.animateToPage(index,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeIn);
                  },
                  controller: pageViewController,
                  count: pagesData.length,
                  effect: const SwapEffect(
                      activeDotColor: Color(0xff6C63FF),
                      dotColor: Colors.black,
                      spacing: 3,
                      dotHeight: 6,
                      dotWidth: 13),
                ),
                GestureDetector(
                  onTap: () {
                    pageViewController.nextPage(
                        duration: const Duration(microseconds: 1000),
                        curve: Curves.easeIn);
                    if (pageViewController.page == pagesData.length - 1) {
                      Get.off(() => const SignInPage());
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    width: Helpers.height * 0.06,
                    height: Helpers.height * 0.06,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
