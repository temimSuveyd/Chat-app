import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/chat/custom_message_options_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message_Options extends StatelessWidget {
  const Message_Options({
    super.key,
    required this.delete,
    required this.share,
    required this.copy,
    required this.messageType,
    required this.download,
  });

  final Function() delete;
  final Function() share;
  final Function() copy;
  final Function() download;

  final String messageType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 60,
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColor.background,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(16, 158, 158, 158),
                    blurRadius: 0.3,
                    spreadRadius: 0.5,
                    offset: Offset(0, -1))
              ],
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 0.1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Message_Options_Button(
                icon: Icons.share,
                onPressed: () {
                  share();
                },
                title: "Share".tr,
              ),
              messageType == "image" || messageType == "video"
                  ? Message_Options_Button(
                      icon: Icons.download_rounded,
                      onPressed: () {
                        download();
                      },
                      title: "Download".tr,
                    )
                  : Message_Options_Button(
                      icon: Icons.copy,
                      onPressed: () {
                        copy();
                      },
                      title: "Copy".tr,
                    ),
              Message_Options_Button(
                icon: Icons.delete,
                onPressed: () {
                  delete();
                },
                title: "Delete".tr,
              ),
            ],
          ),
        ),
        GetBuilder<ChatControllerImp>(
          builder: (controller) => Positioned(
              right: 0,
              top: -25,
              child: IconButton(
                  onPressed: () {
                    controller.hidenOptions();
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 25,
                  ))),
        )
      ],
    );
  }
}
