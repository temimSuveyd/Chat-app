import 'dart:math';

import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectiondImageCard extends StatelessWidget {
  const RedirectiondImageCard({
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
                    height: 100,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(chatMessage.redirectionMessage),
                          fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.circular(5),
                      color: user
                          ? AppColor.bg_brand_solid
                          : const Color.fromARGB(36, 158, 158, 158),
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
