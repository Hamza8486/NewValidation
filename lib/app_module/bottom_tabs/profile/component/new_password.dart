
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
import 'package:validation/services/api_manager.dart';
import 'package:validation/utils/Widgets/app_button.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/validate_field.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/loader/loader.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key,this.id}) : super(key: key);

  final authController = Get.put(AuthController());
  var id;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                AppText(
                  title: "Create new password",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_18,
                  fontFamily: Weights.semi,
                ),
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.clear,color: AppColor.blackColor,size: AppSizes.SIZE_25,))
              ],
            ),
            SizedBox(height: Get.height*0.001,),

            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Obx(
                          () {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: Get.height * 0.01,
                            ),

                            AppText(
                              title: "Your new password must be different to\nthose that you have used previously.",
                              color: AppColor.onboardText.withOpacity(0.6),
                              size: AppSizes.SIZE_12,
                              fontFamily: Weights.regular,
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),

                            AppText(
                              title: "Password",
                              color: AppColor.onboardText,
                              size: AppSizes.SIZE_14,
                              fontFamily: Weights.semi,
                            ),
                            SizedBox(
                              height: Get.height * 0.013,
                            ),
                            ValidateField(
                              isborderline: true,
                              obsecure: authController.isVisible4.value,
                              controller: authController.newConfirmController,
                              isborderline2: true,
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                          isVisible: true,
                              isSuffix: true,
                              suffixIcon: Icon(
                                  authController.isVisible4.value ? Icons.visibility_off : Icons.visibility,
                                  size: Get.height*0.022,
                                  color: AppColor.hintColor),
                              borderRadius: BorderRadius.circular(10),
                              borderRadius2: BorderRadius.circular(10),
                              hint: "Password",

                              borderColor:AppColor.borderColor,
                              borderColor2: AppColor.yellowColor,
                              maxLines: 1,
                              textInputType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              hintColor: AppColor.hintColor,
                              hintSize: AppSizes.SIZE_13,
                              validator: ( value){
                                if(value!.isEmpty)
                                {
                                  return 'Please enter password';
                                }
                                if(value.length<8)
                                {
                                  return 'Password must be greater then 8 character';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),

                            AppText(
                              title: "Confirm Password",
                              color: AppColor.onboardText,
                              size: AppSizes.SIZE_14,
                              fontFamily: Weights.semi,
                            ),
                            SizedBox(
                              height: Get.height * 0.013,
                            ),
                            ValidateField(
                              isborderline: true,
                              obsecure: authController.isVisible5.value,
                              controller: authController.changeConfirmController,
                              isborderline2: true,
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                          isVisible: true,
                              isSuffix: true,
                              suffixIcon: Icon(
                                  authController.isVisible5.value ? Icons.visibility_off : Icons.visibility,
                                  size: Get.height*0.022,
                                  color: AppColor.hintColor),
                              borderRadius: BorderRadius.circular(10),
                              borderRadius2: BorderRadius.circular(10),
                              hint: "Confirm password",

                              borderColor:AppColor.borderColor,
                              borderColor2: AppColor.yellowColor,
                              maxLines: 1,
                              textInputType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              hintColor: AppColor.hintColor,
                              hintSize: AppSizes.SIZE_13,
                              validator: ( value){
                                if (value!.isEmpty) {
                                  return "Please enter confirm password ";
                                } else if (value !=
                                    authController.newConfirmController.text) {
                                  return "Password must be same as above";
                                } else {
                                  return null;
                                }
                              },
                            ),


                            SizedBox(
                              height: Get.height * 0.06,
                            ),
                            AppButton(
                                  buttonName: "Change password",
                                buttonColor: AppColor.primaryColor,
                                buttonRadius: BorderRadius.circular(10),
                                buttonWidth: Get.width,
                                fontFamily: Weights.semi,
                                textColor: AppColor.whiteColor,
                                onTap: () {

                                  if (formKey.currentState!.validate()) {
                                    showLoadingIndicator(context: context);
                                  ApiManger().newPassword1(context: context,id: id.toString(),pass: authController.newConfirmController.text,confirm: authController.newConfirmController.text);
                                    return;
                                  }
                                }),

                          ],
                        );
                      }
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
