
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
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


class NewPassword extends StatelessWidget {
  NewPassword({Key? key,this.id}) : super(key: key);
  var id;
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
                  width: Get.width * 0.15,
                ),
                AppText(
                  title: "Recover Password",
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
                  child: Obx(
                     () {
                      return Column(
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
                              obsecure: authController.isVisible2.value,
                              controller: authController.forgetPasswordController,
                              isborderline2: true,
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                          isVisible: true,
                              isSuffix: true,
                              suffixIcon: Icon(
                                  authController.isVisible2.value ? Icons.visibility_off : Icons.visibility,
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
                          ValidateField(
                            isborderline: true,
                            obsecure: authController.isVisible3.value,
                            controller: authController.forgetConfirmController,
                            isborderline2: true,
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                          isVisible: true,
                            isSuffix: true,
                            suffixIcon: Icon(
                                authController.isVisible3.value ? Icons.visibility_off : Icons.visibility,
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
                                  authController.forgetPasswordController.text) {
                                return "Password must be same as above";
                              } else {
                                return null;
                              }
                            },
                          ),


                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          AppButton(
                              buttonName: "Recover password",
                              buttonColor: AppColor.primaryColor,
                              buttonRadius: BorderRadius.circular(10),
                              buttonWidth: Get.width,
                              fontFamily: Weights.semi,
                              textColor: AppColor.whiteColor,
                              onTap: () {
                                print(authController.forgetPasswordController.text);
                                print(authController.forgetConfirmController.text);
                                if (formKey.currentState!.validate()) {
                                  showLoadingIndicator(context: context);
                               ApiManger().newPassword(context: context,id: id.toString(),pass: authController.forgetPasswordController.text,confirm: authController.forgetConfirmController.text);
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
