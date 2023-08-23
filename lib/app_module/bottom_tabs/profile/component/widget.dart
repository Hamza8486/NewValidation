import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

Widget fieldWidget( TextEditingController? controller,label,onTap,color){
  return    TextFormField(
    onTap: onTap,
    controller:controller ,
    readOnly: true,
    style: TextStyle(fontFamily: Weights.medium,color: AppColor.onboardText.withOpacity(0.5),fontSize: AppSizes.SIZE_14),
    cursorColor: AppColor.primaryColor,

    showCursor: false,


    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: Get.height*0.022,left: Get.width*0.04,right: Get.width*0.04,bottom: Get.height*0.015),

      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.dropColor,width: 1),


      ),
      suffixIcon: Icon(Icons.arrow_right,color:color,),


      labelText: label,


      hintStyle: TextStyle(fontFamily: Weights.regular,color: AppColor.onboardText),


      labelStyle: TextStyle(fontFamily: Weights.semi,color: AppColor.onboardText,fontSize: AppSizes.SIZE_16),
      hintText: 'hint',
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.dropColor,width: 1)
      ),


    ),
  );
}