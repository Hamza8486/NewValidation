import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

Widget videoListWidget(
    {String thumbnail = '', String videoTitle = '', String videoTime = ''}) {
  return Column(
    children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
            thumbnail,
            height: Get.height * 0.1,
            width: Get.height * 0.1,
            fit: BoxFit.cover,

                )
            ),












          SizedBox(
            width: Get.width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width*0.6,
                child: AppText(
                    title: videoTitle,
                    maxLines: 2,
                    color: AppColor.onboardText,
                    textAlign: TextAlign.justify,
                    size: AppSizes.SIZE_12,
                    fontFamily: Weights.medium),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              AppText(
                  title: videoTime,
              color: AppColor.onboardText,
  size: AppSizes.SIZE_11,
  fontFamily: Weights.regular),
            ],
          )
        ],
      ),
      SizedBox(
        height: Get.height * 0.01,
      ),
      const Divider(),
      SizedBox(
        height: Get.height * 0.01,
      ),
    ],
  );
}

List videoList = [
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },
  {
    "thumbnail": "assets/images/pic.png",
    "videoTitle": "Introduction of cliftons with new technology aspets ",
    "videoTime": "2 hour ago",
  },

];
