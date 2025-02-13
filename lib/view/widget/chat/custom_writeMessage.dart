

import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/chat/custom_loadingCard.dart';
import 'package:chat_app/view/widget/chat/custom_media_type_buttomSheet.dart';

import 'package:chat_app/view/widget/chat/custom_textfeild.dart';
import 'package:chat_app/view/widget/chat/custom_writeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class WriteMessage extends GetView<ChatControllerImp> {
  const WriteMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: GetBuilder<ChatControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5
          ),
          child: Row(
            children: [
              textField(
                obMediaPicke: () {
                  media_type_ButtomSheet(context, controller);
                },
                onTap: () {
                  controller.changeSendButton();
                },
                hintText: "Enter message",
                validator: (p0) {
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: controller.textController,
                enabled: true,
                color: AppColor.bg_tertiarty,
              ),
              const Spacer(),
              controller.messageStatus
                  ? LoadingCard()
                  : controller.isRecord
                      ? RippleAnimation(
                          color: AppColor.bg_brand_soli,
                          maxRadius: 2,
                          repeat: true,
                          ripplesCount: 5,
                          child: WriteButton(
                            record: controller.isRecord,
                            iconData:
                                controller.change ? Icons.send : Icons.mic,
                            onTap: () {
                              if (controller.change) {
                                controller.sendMessage();
                              } else {
                                if (controller.isRecord) {
                                  controller.stopRecord();
                                } else {
                                  controller.startRecord();
                                }
                              }
                            },
                          ),
                        )
                      : WriteButton(
                          record: controller.isRecord,
                          iconData: controller.change ? Icons.send : Icons.mic,
                          onTap: () {
                            if (controller.change) {
                              controller.sendMessage();
                            } else {
                              if (controller.isRecord) {
                                controller.stopRecord();
                              } else {
                                controller.startRecord();
                              }
                            }
                          },
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
