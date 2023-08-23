
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/home/controller/home_controller.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class DashboardView extends StatelessWidget {
   DashboardView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.03),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.04,),
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Welcome Back!",
                          size: AppSizes.SIZE_14,
                          fontFamily: Weights.medium,
                          color: AppColor.onboardText,
                        ),
                        AppText(
                          title: homeController.name.value,
                          color: AppColor.primaryColor,
                          size: AppSizes.SIZE_16,
                          fontFamily: Weights.semi,
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.height * 0.065,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(80),
                      border: Border.all(color: AppColor.primaryColor,width: 1.5)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                         homeController.image.value,
                          fit: BoxFit.fill,
                          errorBuilder: (context, exception, stackTrace) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/person.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
            SizedBox(height: Get.height*0.05,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text( "Welcome to your journey from Talent to Strength.",
                      textAlign: TextAlign.center,

                      style: TextStyle(

                      fontSize: AppSizes.SIZE_15,


                      fontFamily: Weights.semi,
                      color: AppColor.onboardText,
                      fontStyle: FontStyle.italic,
                    ),),

                    SizedBox(height: Get.height*0.03,),
                    AppText(
                      title: "A Talent is a natural and intuitive motivation from which we respond to the circumstances of life. Your particular mix of talents will shape your contributions to your work and relationships",
                      size: AppSizes.SIZE_13,
                      textAlign: TextAlign.justify,
                      fontFamily: Weights.medium,
                      color: AppColor.onboardText,
                    ),
                    SizedBox(height: Get.height*0.02,),
                    AppText(
                      title: "To move these Talents toward the consistently high performance of a Strength requires curiosity, personal insights, and courageous vulnerability.  The resources in this app are designed help you in this.",
                      size: AppSizes.SIZE_13,
                      textAlign: TextAlign.justify,
                      fontFamily: Weights.medium,
                      color: AppColor.onboardText,
                    ),

                    SizedBox(height: Get.height*0.06,),
                    Text("“May you find the journey an enriching and rewarding one”",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: AppSizes.SIZE_15,
                      fontFamily: Weights.semi,
                      fontStyle: FontStyle.italic,
                      color: AppColor.primaryColor,
                    ),)
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
