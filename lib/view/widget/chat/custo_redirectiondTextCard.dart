import 'dart:math';

import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectiondTextCard extends StatelessWidget {
  const RedirectiondTextCard({
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
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: user
                          ? AppColor.bg_brand_solid
                          : const Color.fromARGB(36, 158, 158, 158),
                    ),
                    child: Text(
                      chatMessage.redirectionMessage,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTextStyle.semiBold14_20.copyWith(
                          color: user ? Colors.white : Colors.black87),
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
