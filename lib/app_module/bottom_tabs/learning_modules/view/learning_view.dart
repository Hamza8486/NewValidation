
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/bottom_tabs/learning_modules/controller/learning_controller.dart';
import 'package:validation/app_module/clifton_strength_view/view/clifton_view.dart';
import 'package:validation/app_module/frustration_view/view/view.dart';
import 'package:validation/app_module/needs_view/view/needs_view.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class LearningView extends StatelessWidget {
   LearningView({Key? key}) : super(key: key);

  final onTaped = Get.put(LearningController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.03),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.04,),
            Center(
              child: AppText(
                title: "Learning Modules",
                color: AppColor.primaryColor,
                size: AppSizes.SIZE_18,
                fontFamily: Weights.semi,
              ),
            ),
            SizedBox(height: Get.height*0.05,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              onTaped.expanded();
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * 0.055,
                                  decoration: BoxDecoration(

                                      border: Border.all(
                                          color: onTaped.expand.value
                                              ? AppColor.primaryColor
                                              : AppColor.dropColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        AppText(
                                          title: "Select a module",
                                            fontFamily: Weights.regular,
                                            size: AppSizes.SIZE_13,

                                            color:
                                            AppColor.onboardText,

                                            ),
                                        const Spacer(),
                                        Icon(
                                          onTaped.expand.value
                                              ? Icons.arrow_drop_up_rounded
                                              : Icons.arrow_drop_down_rounded,
                                          color:
                                          AppColor.blackColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTaped.expand.value
                              ? Container(
                            decoration:  const BoxDecoration(

                                border: Border(
                                    bottom: BorderSide(width: 0.03),
                                    left: BorderSide(width: 0.1),
                                    right: BorderSide(width: 0.1))),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: optionList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {

                                    },
                                    child: optionWidget(
                                        text: optionList[index],
                                        index: index,
                                        onTap: () {
                                          onTaped.expanded();
                                          index == 0
                                              ? Get.to(CliftonView())
                                              : index == 1
                                              ? Get.to(NeedsView())
                                              : index == 2
                                              ? Get.to(FrustrationView())
                                              : Container();
                                          onTaped.updateTap(index);
                                        },
                                        click: onTaped.click.value == index
                                            ? true
                                            : false
                                    ),
                                  );
                                }),
                          )
                              : Container(),
                        ],
                      );
                    }),




                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height*0.03,),
            Image.asset(
              "assets/images/text.png",
              height: Get.height * 0.02,
            ),
            SizedBox(height: Get.height*0.015,),
            AppText(
              title: "We learn by reflecting on what has happened. The process seldom works in reverse.",
              size: AppSizes.SIZE_12,
              textAlign: TextAlign.center,
              fontFamily: Weights.medium,
              color: AppColor.onboardText,
            ),
            SizedBox(height: Get.height*0.006,),
            AppText(
              title: "Charles Handy",
              size: AppSizes.SIZE_12,
              textAlign: TextAlign.center,
              fontFamily: Weights.semi,
              color: AppColor.primaryColor,
            ),



          ],
        ),
      ),
    );
  }
}
