import 'package:chat_app/controller/viewVideoController.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../core/constanst/color.dart';

class ViewVideoPage extends GetView<ViewVideoControllerImp> {
  const ViewVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ViewVideoControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.background),
      body: FlickVideoPlayer(
          flickManager: FlickManager(
              videoPlayerController: VideoPlayerController.networkUrl(
                  Uri.parse(controller.video!)))),
    );
  }
}
