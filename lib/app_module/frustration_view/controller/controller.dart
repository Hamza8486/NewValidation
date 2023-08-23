import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

class FrusController extends GetxController {
  var contributionTap = false.obs;
  var contributionExpand = false.obs;
  var contributionExpand1 = false.obs;
  var click = 0.obs;
  var textData = "".obs;
  var textData1 = "".obs;

  updateOption() {
    contributionTap.toggle();
    update();
  }

  updateExpand() {
    contributionExpand.toggle();
    update();
  }

  updateExpand1() {
    contributionExpand1.toggle();
    update();
  }

  updateClick(val) {
    click.value = val;
    update();
  }

  updateText(text) {
    textData.value = text;
  }

  updateText1(text) {
    textData1.value = text;
  }
}

List contributionoptionList = [
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten",
  "Eleven",
  "Twelve",
  "Thirteen",
  "Fourteen",
  "Fifteen",
];
List selectReflectionList = [
  "I'm Frustrated When",
  "Stories About Myself/Others",
  "The Overuse",
  "What I'm Hoping to Achieve",
  "Regaining Calm",
];

Widget optopnWidget(
    {String options = '', required VoidCallback onTap, required bool click}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: click ? AppColor.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: options,
              color: click
                  ? AppColor.whiteColor
                  : AppColor.onboardText,
              size: AppSizes.SIZE_13,
              fontFamily: Weights.medium,
            ),
          ],
        ),
      ),
    ),
  );
}
