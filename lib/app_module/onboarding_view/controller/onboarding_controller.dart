
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/authentication/login/login_view.dart';
import 'package:validation/app_module/onboarding_view/model/onboarding_model.dart';
import 'package:validation/utils/constants/asset_path.dart';
import 'package:validation/utils/constants/strings.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(LoginView());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onboardingPages = [
    OnBoardingInfo(Images.onBoarding1, Strings.title1, Strings.subTitle1),
    OnBoardingInfo(Images.onBoarding2, Strings.title2, Strings.subTitle2),
    OnBoardingInfo(Images.onBoarding3, Strings.title3, Strings.subTitle3),
    OnBoardingInfo(Images.onBoarding4, Strings.title4, Strings.subTitle4),
  ];
}
