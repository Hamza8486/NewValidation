
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/frustration_view/controller/controller.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/back_button.dart';
import 'package:validation/utils/Widgets/validate_field.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';


import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class FrustrationView extends StatelessWidget {
  FrustrationView({Key? key}) : super(key: key);

  final contributionController = Get.put(FrusController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: Column(
          children: [
            SizedBox(height: Get.height*0.04,),
            Row(
              children: [
                backButton(
                    color: AppColor.backColor,
                    onTap: () {
                      Get.back();
                    }),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                AppText(
                  title: "Frustrations & Overuse",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_16,
                  fontFamily: Weights.semi,
                ),
                const SizedBox()
              ],
            ),
            SizedBox(height: Get.height*0.035,),


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          contributionController.updateExpand();
                        },
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.055,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.5,
                                      color: contributionController
                                          .contributionExpand.value
                                          ? AppColor.primaryColor
                                          : AppColor.dropColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    AppText(
                                      fontFamily:

                                      contributionController
                                          .textData
                                          .value == ""?
                                      Weights.regular:Weights.medium,
                                      size: AppSizes.SIZE_13,

                                      color:

                                      AppColor.onboardText,

                                      title: contributionController
                                          .textData
                                          .value ==
                                          ""
                                          ? 'Select a theme'
                                          : contributionController
                                          .textData
                                          .value,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      contributionController
                                          .contributionExpand.value
                                          ? Icons.arrow_drop_up_rounded
                                          : Icons.arrow_drop_down_rounded,
                                      color: AppColor.blackColor
                                          .withOpacity(.5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            contributionController.contributionExpand.value
                                ?
                            SizedBox(height: Get.height*0.01,):SizedBox.shrink(),
                            contributionController.contributionExpand.value
                                ? Container(
                              height: Get.height*0.28,
                              width: Get.width,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(width: 0.03),
                                      bottom: BorderSide(width: 0.03),
                                      left: BorderSide(width: 0.1),
                                      right: BorderSide(width: 0.1))),
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount: contributionoptionList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Obx(() {
                                      return optopnWidget(
                                          options:
                                          contributionoptionList[index],
                                          onTap: () {
                                            contributionController
                                                .updateText(
                                                contributionoptionList[
                                                index]);
                                            contributionController
                                                .updateExpand();
                                            contributionController
                                                .updateClick(index);
                                          },
                                          click: contributionController
                                              .click.value ==
                                              index
                                              ? true
                                              : false);
                                    });
                                  }),
                            )
                                :SizedBox.shrink(),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    ValidateField(

                      isborderline: true,
                      isborderline2: true,
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.015),
                      borderRadius: BorderRadius.circular(10),
                      borderRadius2: BorderRadius.circular(10),
                      borderColor:AppColor.dropColor,
                      hint: "Video Link",
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      hintColor: AppColor.hintColor,
                      hintSize: AppSizes.SIZE_13,
                      borderColor2: AppColor.yellowColor,

                      maxLines: 1,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              contributionController.updateExpand1();
                            },
                            child: Container(
                              height: Get.height * 0.055,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  border: Border.all(
                                      color: contributionController
                                          .contributionExpand1.value
                                          ? AppColor.primaryColor
                                          : AppColor.dropColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    AppText(
                                      fontFamily:
                                      contributionController
                                          .textData1
                                          .value == ""?
                                      Weights.regular:Weights.medium,
                                      size: AppSizes.SIZE_13,

                                      color:

                                      AppColor.onboardText,
                                      title: contributionController
                                          .textData1
                                          .value ==
                                          ""
                                          ? 'Select a reflection'
                                          : contributionController
                                          .textData1
                                          .value,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      contributionController
                                          .contributionExpand1.value
                                          ? Icons.arrow_drop_up_rounded
                                          : Icons.arrow_drop_down_rounded,
                                      color: AppColor.blackColor
                                          .withOpacity(.5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          contributionController.contributionExpand1.value?
                          SizedBox(height: Get.height*0.01,):SizedBox.shrink(),
                          contributionController.contributionExpand1.value
                              ? Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(width: 0.03),
                                    bottom: BorderSide(width: 0.03),
                                    left: BorderSide(width: 0.1),
                                    right: BorderSide(width: 0.1))),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: selectReflectionList.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Obx(() {
                                    return optopnWidget(
                                        options:
                                        selectReflectionList[index],
                                        onTap: () {
                                          contributionController
                                              .updateText1(
                                              selectReflectionList[
                                              index]);
                                          contributionController
                                              .updateExpand1();
                                          contributionController
                                              .updateClick(index);
                                        },
                                        click: contributionController
                                            .click.value ==
                                            index
                                            ? true
                                            : false);
                                  });
                                }),
                          )
                              : Container(),
                        ],
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    ValidateField(

                      isborderline: true,
                      isborderline2: true,
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.015),
                      borderRadius: BorderRadius.circular(10),
                      borderRadius2: BorderRadius.circular(10),
                      borderColor:AppColor.dropColor,
                      hint: "Video Link",
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      hintColor: AppColor.hintColor,
                      hintSize: AppSizes.SIZE_13,
                      borderColor2: AppColor.yellowColor,

                      maxLines: 1,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),

                    ValidateField(

                      isborderline: true,
                      isborderline2: true,
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.015),
                      borderRadius: BorderRadius.circular(10),
                      borderRadius2: BorderRadius.circular(10),
                      borderColor:AppColor.dropColor,

                      hint: "I write my ideas in here.",
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      hintColor: AppColor.hintColor,
                      hintSize: AppSizes.SIZE_13,
                      borderColor2: AppColor.yellowColor,

                      maxLines: 3,
                    ),

                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
