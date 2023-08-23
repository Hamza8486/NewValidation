import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/authentication/login/login_view.dart';
import 'package:validation/app_module/onboarding_view/controller/onboarding_controller.dart';
import 'package:validation/utils/Widgets/app_button.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/constants/strings.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/loader/loader.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);

  final controller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    hideKeyBoard(context);
    return Scaffold(
      body: Padding(
        padding: AppPaddings.accountPadding,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Get.to(LoginView());
                  },
                  child: AppText(
                    title: Strings.skip,
                    color: AppColor.primaryColor,
                    fontFamily: Weights.semi,
                    size: AppSizes.SIZE_16,
                  ),
                ),
              ),

              SizedBox(
                width: Get.width,
                height: Get.height * 0.65,
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: controller.selectedPageIndex,
                    itemCount: controller.onboardingPages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset( controller.onboardingPages[index].imageAsset,
                            height: Get.height * 0.23,

                          ),

                          SizedBox(height: Get.height * 0.07),
                          AppText(
                            title: controller.onboardingPages[index].title,
                            color: AppColor.onboardText,
                            fontFamily: Weights.semi,
                            textAlign: TextAlign.center,
                            size: AppSizes.SIZE_18,
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.06),
                            child: AppText(
                              title:
                                  controller.onboardingPages[index].description,
                              color: AppColor.onboardGrey,
                              fontFamily: Weights.medium,
                              textAlign: TextAlign.center,
                              size: AppSizes.SIZE_13,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: Get.height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: Get.height*0.012,
                      height: Get.height*0.012,
                      decoration: BoxDecoration(
                        color: controller.selectedPageIndex.value == index
                            ? AppColor.primaryColor
                            : AppColor.onboardGrey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
             AppButton(
                  buttonName:
                       Strings.getStarted ,
                  buttonColor: AppColor.primaryColor,
                  buttonWidth: Get.width,
                  buttonHeight: Get.height * 0.06,
                  textSize: AppSizes.SIZE_15,
                  buttonRadius: BorderRadius.circular(10),
                  textColor: AppColor.whiteColor,
                  fontFamily: Weights.semi,
                  onTap: controller.forwardAction,
                )


            ],
          ),
        ),
      ),
    );
  }
}
