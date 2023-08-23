import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';



Widget backButton({onTap,required color}) {
  return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(side: BorderSide(color: AppColor.blackColor.withOpacity(0.1)),

          borderRadius: BorderRadius.circular(5),
        ),

        color: color,

        child: Padding(
          padding: EdgeInsets.only(
              left: Get.width * 0.022,
              right: Get.width * 0.027,
              top: Get.height * 0.01,
              bottom: Get.height * 0.012),
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColor.primaryColor,
            size: AppSizes.SIZE_13,
          ),
        ),
      ));
}
