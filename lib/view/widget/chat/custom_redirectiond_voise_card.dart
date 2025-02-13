import 'dart:math';

import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectiondVoiseCard extends StatelessWidget {
  const RedirectiondVoiseCard({
    required this.user,
    required this.chatMessage,
  });

  final bool user;

  final ChatMessage chatMessage;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment:
            user ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          GestureDetector(
            onDoubleTap: () {
              controller.showOptions(true, chatMessage.message_id,
                  chatMessage.message, chatMessage.messageType);
            },
            child: Container(
              width: max(10, Get.width * 0.6),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: user
                    ? const Color.fromARGB(36, 158, 158, 158)
                    : AppColor.bg_brand_solid,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: max(10, Get.width * 0.9),
                    height: 40,
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      // image: DecorationImage(image: AssetImage(AppImages.voise),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.bg_tertiarty,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Voise Record",
                          style: AppTextStyle.semiBold14_20
                              .copyWith(color: AppColor.text_secondary),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.bg_brand_solid),
                          child: Icon(Icons.mic,color:  AppColor.text_quarterary,),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    chatMessage.message,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
