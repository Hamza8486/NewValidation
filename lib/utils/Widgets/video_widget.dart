// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, avoid_print, unused_local_variable, unused_field, unnecessary_string_interpolations, unrelated_type_equality_checks, avoid_unnecessary_containers, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:validation/utils/Widgets/app_text.dart';
import 'package:validation/utils/color/app_colors.dart';
import 'package:validation/utils/fonts/app_fonts.dart';
import 'package:video_player/video_player.dart';


class AppVideoPlayer extends StatefulWidget {
  String videoUrl;
  bool isAutoPlay;

  //
  // const AppVideoPlayer({
  //
  // });

  AppVideoPlayer({Key? key, required this.videoUrl, required this.isAutoPlay})
      : super(key: key);

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<void> _future;

  Future<void> initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {
      _chewieController = ChewieController(
          allowFullScreen: true,
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          autoPlay: widget.isAutoPlay,
          looping: false,
          showControls: widget.isAutoPlay,
          showControlsOnInitialize: true,
          showOptions: true,
          allowMuting: true,
          autoInitialize: true,
          allowPlaybackSpeedChanging: true);
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.videoUrl);
    _videoPlayerController = widget.videoUrl.contains('com.digixValley.foodage')
        ? VideoPlayerController.file(File(widget.videoUrl))
        : VideoPlayerController.network('${widget.videoUrl}');
    // VideoPlayerController.asset('assets/videos/himdeveIntro.mp4')

    _future = initVideoPlayer();
    // _videoPlayerController.setVolume(0.015);
    if (widget.isAutoPlay) {
      _videoPlayerController.pause();
    }
  }

  late VideoPlayerController _controller;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.videoUrl);
    return Container(
      // width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.blackColor,
      ),
      child: Center(
        child: new FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              return new ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: _videoPlayerController.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: 1,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                )
                    : CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            }),
      ),
    );
  }
}

Widget listData({icon, title}) {
  return Container(
    decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        border: Border.all(color: AppColor.greyColors.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: Get.width * 0.018,
          ),
          AppText(
            title: title,
            size: Get.height * 0.0135,
            color: AppColor.blackColor.withOpacity(0.6),
            fontFamily: Weights.regular,
          )
        ],
      ),
    ),
  );
}
