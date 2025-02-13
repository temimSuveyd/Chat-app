  import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/chat/custom_mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> media_type_ButtomSheet(BuildContext context , ChatControllerImp controller) {
    return showModalBottomSheet(
      backgroundColor: AppColor.background,
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  width: Get.width,
                  child: Column(
                    children: [
                      MediaTypeButton(
                        icon: Icons.image,
                        text: "image",
                        onTap: () {
                          controller.pickedImage();
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MediaTypeButton(
                              icon: Icons.video_camera_back_rounded,
                        text: "video",
                        onTap: () {
                          controller.pickedVideo();
                          Get.back();

                        },
                      ),
                    ],
                  ),
                ),
              );
  }

