// Rich Text
import 'package:flutter/material.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

class RichTexts extends StatelessWidget {
  const RichTexts(
      {Key? key, this.text = "", this.text1 = "", required this.onTap})
      : super(key: key);

  final String text;
  final String text1;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(
                fontFamily: Weights.regular,
                color: AppColor.onboardText,
                fontSize: AppSizes.SIZE_13),
            children: <TextSpan>[
              TextSpan(
                  text: text1,
                  style: TextStyle(
                      fontFamily: Weights.semi,
                      color: AppColor.yellowColor,
                      fontSize: AppSizes.SIZE_13)),
            ],
          ),
        ),
      ),
    );
  }
}