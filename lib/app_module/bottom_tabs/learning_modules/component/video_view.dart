// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validation/utils/Widgets/app_text.dart';

import 'package:validation/utils/Widgets/video_widget.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:validation/utils/sizes/app_dimensions.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoViewDetail extends StatelessWidget {
  VideoViewDetail({Key? key,this.data}) : super(key: key);

  var data;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height*0.06,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
            child: Row(

              children: [
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_outlined,color: AppColor.blackColor,size: AppSizes.SIZE_25,)),
                SizedBox(width: Get.width*0.04,),
                AppText(
                  title: "CliftonStrengths Overview",
                  color: AppColor.primaryColor,
                  size: AppSizes.SIZE_16,
                  fontFamily: Weights.semi,
                ),

              ],
            ),
          ),
          SizedBox(height: Get.height*0.02,),
          data.link !=
              null
              ? Expanded(
                child: YoutubePlayer(
            controller: YoutubePlayerController(
                initialVideoId:
                YoutubePlayer.convertUrlToId(
                    data.link
                )!, //Add videoID.
                flags: YoutubePlayerFlags(
                  hideControls: false,
                  controlsVisibleAtStart: true,
                  autoPlay: false,
                  mute: false,
                ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor:
            AppColor.primaryColor,
          ),
              )
              : SizedBox(
            height: Get.height * 0.35,
            width: Get.width,
            child: AppVideoPlayer(
              isAutoPlay: true,
              videoUrl:
              "https://d3ta5i4slm0uga.cloudfront.net/videos_module/2022/07/VID-20220728-WA0020B2043EB591_compressed.mp4",
            ),
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),


        ],
      ),
    );
  }
}
