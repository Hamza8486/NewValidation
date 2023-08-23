
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:validation/app_module/authentication/component/auth_component.dart';
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
import 'package:validation/app_module/authentication/forget_password/forget_password.dart';
import 'package:validation/app_module/authentication/register/register_view.dart';
import 'package:validation/services/api_manager.dart';
import 'package:validation/utils/Widgets/app_button.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/helper_function.dart';
import 'package:validation/utils/Widgets/validate_field.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/constants/asset_path.dart';
import 'package:validation/utils/constants/strings.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/loader/loader.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  String ? token;
  void getToken() async{
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    HelperFunctions.saveInPreference("token", token!);
    print("token");
    print(token);
  }
  final authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    print("token");
    print(token);
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: Column(
          children: [
            SizedBox(height: Get.height*0.08,),
            Center(
              child: Image.asset(
                Images.logo,
                height: Get.height * 0.17,
              ),
            ),
            SizedBox(height: Get.height*0.02,),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height*0.07,),

                      ValidateField(

                        isborderline: true,
                        autovalidateMode:  AutovalidateMode.onUserInteraction,
                        isborderline2: true,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter valid username or email';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                        borderRadius: BorderRadius.circular(10),
                        borderRadius2: BorderRadius.circular(10),
                        borderColor:AppColor.borderColor,
                        hint: "Email, username",
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,

                        controller: authController.loginEmailController,

                        hintColor: AppColor.hintColor,
                        hintSize: AppSizes.SIZE_13,
                        borderColor2: AppColor.yellowColor,

                        maxLines: 1,
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Obx(() {
                          return ValidateField(
                            isborderline: true,
                            obsecure: authController.isVisible.value,
                            controller: authController.loginPasswordController,
                            isborderline2: true,
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.0185),                            isVisible: true,
                            isSuffix: true,
                            autovalidateMode:  AutovalidateMode.onUserInteraction,
                            suffixIcon: GestureDetector(
                              onTap: (){
                                authController.updateVisibleStatus();
                              },
                              child: Icon(
                                  authController.isVisible.value ? Icons.visibility_off : Icons.visibility,
                                  size: Get.height*0.022,
                                  color: AppColor.hintColor),
                            ),
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
                          );
                        }
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ForgetPassword());
                            authController.clearLogin();
                            authController.clearReg();
                          },
                          child: AppText(
                              title: Strings.forgetPassword,
                              color: AppColor.onboardText,
                              fontFamily: Weights.medium,
                              size: AppSizes.SIZE_12),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),


                      AppButton(
                          buttonName: "Log In",
                          buttonColor: AppColor.primaryColor,
                          buttonRadius: BorderRadius.circular(10),
                          buttonWidth: Get.width,
                          fontFamily: Weights.semi,
                          textColor: AppColor.whiteColor,
                          onTap: () {

                            if (formKey.currentState!.validate()) {
                              showLoadingIndicator(context: context);
                              ApiManger().loginResponse(context: context,token: token);

                              return;
                            }
                          }),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      RichTexts(
                        text1: Strings.signupNow,
                        text: Strings.dntHaveAccount,
                        onTap: () {

                          Get.to(RegisterView());
                        },
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
