
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
import 'package:validation/app_module/authentication/forget_password/new_password.dart';
import 'package:validation/services/api_manager.dart';
import 'package:validation/utils/Widgets/app_button.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/back_button.dart';
import 'package:validation/utils/Widgets/validate_field.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/constants/asset_path.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/loader/loader.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
   final formKey = GlobalKey<FormState>();

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
                  width: Get.width * 0.2,
                ),
                AppText(
                  title: "Forget Password",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_18,
                  fontFamily: Weights.semi,
                ),
                const SizedBox()
              ],
            ),
            SizedBox(height: Get.height*0.02,),

            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Center(
                        child: Image.asset(
                          Images.logo,
                          height: Get.height * 0.17,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.08,
                      ),



                      ValidateField(

                        isborderline: true,
                        isborderline2: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),
                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Email",
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,

                        controller: authController.forgetEmailController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),

                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      AppButton(
                          buttonName: "Send Email",
                          buttonColor: AppColor.primaryColor,
                          buttonRadius: BorderRadius.circular(10),
                          buttonWidth: Get.width,
                          fontFamily: Weights.semi,
                          textColor: AppColor.whiteColor,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              showLoadingIndicator(context: context);
                              ApiManger().forgetResponse();
                              return;
                            }
                          }),

                    ],
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
