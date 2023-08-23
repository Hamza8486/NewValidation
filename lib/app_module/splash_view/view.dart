// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/home/view/home_view.dart';
import 'package:validation/app_module/onboarding_view/view/onboarding_view.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/helper_function.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/constants/asset_path.dart';
import 'package:validation/utils/constants/strings.dart';
import 'package:validation/utils/fonts/app_fonts.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String userType="";

  @override
  void initState() {
    super.initState();

    HelperFunctions.getFromPreference("id").then(
            (value){
          setState(() {
            userType = value;
          });
          print(userType);
          moveToNext();
        });



  }
  void moveToNext() {

    Timer(Duration(seconds:2), () {
      if (userType != "") {
        Get.offAll(
            HomeView(),
            curve: Curves.linear
        );
      }

      else {
        Get.offAll(
            OnBoardingView(),
            curve: Curves.linear
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height*0.41,),

              Center(
                child: AppText(
                  title: Strings.curiosity,
                  color: AppColor.primaryColor,
                  fontFamily: Weights.medium,
                  size: Get.height * 0.025,
                ),
              ),
              SizedBox(height: Get.height*0.04,),
              Image.asset(Images.logo,height: Get.height*0.17,)
            ],
          ),
        ));
  }
}
