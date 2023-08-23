import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

class LearningController extends GetxController {
  var tap = false.obs;
  var expand = false.obs;
  var click = 0.obs;
  var textData = "".obs;

  updateTap(int index) {
    tap.toggle();
    update();
  }

  expanded() {
    expand.toggle();
    update();
  }

  updateClick(val) {
    click.value = val;
    update();
  }

  updateText(text) {
    textData.value = text;
  }
}

List optionList = [
  "CliftonStrengths overview",
  "Contributions & Needs",
  "Frustrations & Overuse",
];

Widget optionWidget(
    {String text = '',
      required index,
      required VoidCallback onTap,
      required bool click}) {
  return Container(
    decoration: BoxDecoration(
        color:
        // click ?
        Colors.transparent,
        borderRadius: BorderRadius.circular(10)),
    child: GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height*0.01,),
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: AppText(
                title: text,
              fontFamily: Weights.regular,
              size: AppSizes.SIZE_13,

              color:
              AppColor.onboardText,),
          ),
        ],
      ),
    ),
  );
}
