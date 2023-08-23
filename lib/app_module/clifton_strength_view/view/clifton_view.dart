
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/app_module/bottom_tabs/learning_modules/component/video_view.dart';
import 'package:validation/app_module/clifton_strength_view/components/video_widget.dart';
import 'package:validation/app_module/home/controller/home_controller.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/Widgets/back_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/paddings/app_paddings.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';


class CliftonView extends StatelessWidget {
   CliftonView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());


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
                  width: Get.width * 0.03,
                ),
                AppText(
                  title: "CliftonStrengths overview",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_16,
                  fontFamily: Weights.semi,
                ),
                const SizedBox()
              ],
            ),
            SizedBox(height: Get.height*0.035,),
            Material(
              color: AppColor.whiteColor,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppColor.onboardText.withOpacity(0.2))
              ),

              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                    maxLines: 1,
                    style: TextStyle(fontSize: Get.height*0.016),


                    decoration:  InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        prefixIcon: Image.asset(
                          "assets/images/search.png",
                          scale: 22,
                          color:AppColor.blackColor,
                        ),
                        hintText:"Search videos",
                        hintStyle: TextStyle(color: AppColor.chooseColor,
                          fontSize: Get.height*0.014,

                          fontFamily: Weights.regular,),
                        border: InputBorder.none

                    ),

                    onChanged: (val) {

                    }

                    ),
              ),
            ),
            SizedBox(height: Get.height*0.02,),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: homeController.videoList.length,
                      itemBuilder: (BuildContext context, index) {
                        final DateTime time1 = DateTime.parse(homeController.videoList[index].createdAt.toString());
                        return GestureDetector(
                          onTap: (){
                            Get.to(VideoViewDetail(data: homeController.videoList[index],));
                          },
                          child: videoListWidget(
                              thumbnail: homeController.videoList[index].thumbnail??"",
                              videoTitle: homeController.videoList[index].title??"",
                              videoTime: timeago.format(time1)),
                        );
                      });
                }
              ),
            ),



          ],
        ),
      ),
    );
  }
}
