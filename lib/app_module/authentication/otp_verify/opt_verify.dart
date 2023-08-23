// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:validation/app_module/authentication/controller/auth_controller.dart';
import 'package:validation/app_module/authentication/login/login_view.dart';
import 'package:validation/services/api_manager.dart';
import 'package:validation/utils/Widgets/app_button.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/exit_app_dialoge.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/constants/asset_path.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/loader/loader.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class VerifyOtp extends StatefulWidget {
   VerifyOtp({
    Key? key,this.id,this.email
  }) : super(key: key);

  var id;
  var email;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String currentText = "";
  final authController = Get.put(AuthController());
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    startTimer();
  }

  bool isEnabled = false;
  String code = "" ;

  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            debugPrint(_start.toString());
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            if (_start == 0) {
              debugPrint(_start.toString());
              timer.cancel();
              isEnabled = true;
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    errorController!.close();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    print(widget.id.toString());
    print(widget.id.toString());
    print(widget.id.toString());
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.mainPadding,
          child: Column(
            children: [
              SizedBox(height: Get.height*0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  AppText(
                    title: "Enter 6 Digits Code",
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                      height: Get.height * 0.015,
                    ),
                    AppText(
                      title: "We sent an email with 6 digit code to",
                      size: AppSizes.SIZE_12,
                      fontFamily: Weights.regular,
                      color: AppColor.fieldColor,
                    ),
                    SizedBox(
                      height: Get.height * 0.004,
                    ),
                    AppText(
                      title: widget.email,
                      size: AppSizes.SIZE_12,
                      fontFamily: Weights.medium,
                      color: AppColor.onboardText,
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.02),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        hintCharacter: "-",
                        hintStyle: TextStyle(color: AppColor.chooseColor),
                        cursorHeight: Get.height * 0.02,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 5) {
                            return "Please enter valid Otp";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          fieldHeight: Get.height * 0.055,
                          fieldWidth: Get.height * 0.055,
                          shape: PinCodeFieldShape.box,
                          borderWidth: 1,
                          activeColor: AppColor.primaryColor,
                          inactiveColor: AppColor.fieldColor,
                          inactiveFillColor: AppColor.whiteColor,
                          activeFillColor: AppColor.whiteColor,
                          selectedFillColor: AppColor.whiteColor,
                          selectedColor: AppColor.primaryColor,
                          disabledColor: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        cursorColor: AppColor.primaryColor,
                        animationDuration:
                        const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        // controller: authController.otpController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                            if (value.length == 6) {
                              setState(() {
                                code = value;
                              });
                            }
                          });
                        },
                        onSubmitted: (value) {},
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    AppButton(
                        buttonName: "Confirm",
                        buttonColor: AppColor.primaryColor,
                        buttonRadius: BorderRadius.circular(10),
                        buttonWidth: Get.width,
                        fontFamily: Weights.semi,
                        textColor: AppColor.whiteColor,
                        onTap: code == ""? () {
                        flutterToast(msg: "please enter verification code");
                        }:
                        authController.forgetEmailController.text.isNotEmpty?(){
                          showLoadingIndicator(context: context);
                          ApiManger().verifyForget(context: context,id: widget.id.toString(),
                              textCode: code
                          );
                        }:

                            (){
                          showLoadingIndicator(context: context);
                          ApiManger().verifyResponse(context: context,id: widget.id.toString(),
                          textCode: code
                          );
                        }

                        ),
                    SizedBox(
                      height: Get.height * 0.022,
                    ),
                    isEnabled
                        ? InkWell(
                        onTap: () {

                          showLoadingIndicator(context: context);
                          ApiManger.resendResponse(
                            context: context,
                            id: widget.id.toString()
                          ).then((value) {
                            if(value!=null){
                              setState(() {
                                _start = 60;
                                startTimer();
                                isEnabled = false;
                              });
                            }
                          });

                        },
                        child: AppText(
                          title: "Resend Code",
                          color: AppColor.primaryColor,
                          fontFamily: Weights.bold,
                        ))
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: "Resend Code in ",
                          size: AppSizes.SIZE_12,
                          fontFamily: Weights.medium,
                          color: AppColor.fieldColor,
                        ),
                        AppText(
                          title: "${_start}s",
                          size: AppSizes.SIZE_12,
                          fontFamily: Weights.medium,
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),



            ],
          ),
        ),
      ),
    );
  }
}
