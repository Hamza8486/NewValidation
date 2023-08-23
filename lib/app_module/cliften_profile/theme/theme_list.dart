import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/home/controller/home_controller.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/back_button.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

class ThemeListAll extends StatelessWidget {
   ThemeListAll({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.03),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.034,),
        Row(
          children: [
            backButton(
                color: AppColor.backColor,
                onTap: () {
                  Get.back();
                }),
            SizedBox(
              width: Get.width * 0.03,
            ),
            AppText(
              title: "Theme List",
              color: AppColor.primaryColor,
              size: AppSizes.SIZE_16,
              fontFamily: Weights.semi,
            ),
            const SizedBox()
          ],
        ),
        SizedBox(
          height: Get.height * 0.025,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: homeController.themeList.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Get.defaultDialog(
                        title: "",
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10),
                        titlePadding:
                        EdgeInsets.zero,

                        content: SizedBox(
                          height: Get.height * 0.29,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Expanded(
                                child: SizedBox(
                                  height: Get.height*0.25,
                                  // Change as per your requirement
                                  width: Get.width*0.7, // Change as per your requirement
                                  child: Obx(
                                          () {
                                        return


                                          ListView.builder(
                                            shrinkWrap: homeController.themeList.isEmpty?true:true,
                                            itemCount:homeController.themeList[index].themes?.length,
                                            itemBuilder: (BuildContext context, int i) {
                                              // final result = stores[index];


                                              return GestureDetector(
                                                onTap: (){

                                                  Get.back();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 10,horizontal: 10),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.do_not_disturb_on_total_silence_outlined,size: Get.height*0.02,),
                                                      SizedBox(width: Get.width*0.02,),
                                                      SizedBox(
                                                        width: Get.width*0.48,
                                                        child: AppText(
                                                            title:
                                                            homeController.themeList[index].themes?[i].theme??"",
                                                            size: AppSizes.SIZE_13,
                                                            overFlow: TextOverflow.ellipsis,
                                                            maxLines: 2,
                                                            fontFamily: Weights.semi,
                                                            textAlign: TextAlign.justify,
                                                            color:
                                                            index == 0?
                                                            AppColor.purpleColor:index == 1?
                                                            AppColor.orangeColor:index == 2?
                                                            AppColor.blueColor:AppColor.greenColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                      }
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                     color:
                     index == 0?
                     AppColor.purpleColor:index == 1?
                     AppColor.orangeColor:index == 2?
                     AppColor.blueColor:AppColor.greenColor

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          AppText(
                            title: homeController.themeList[index].domain??"",
                            color: AppColor.whiteColor,
                            size: AppSizes.SIZE_16,
                            fontFamily: Weights.semi,
                          ),
                          Icon(Icons.arrow_drop_down,size: Get.height*0.03,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),

          ],
        ),
      ),
    );
  }
}
