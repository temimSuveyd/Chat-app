import 'dart:developer';

import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageChatBox extends GetView<ChatControllerImp> {
  const ImageChatBox({
    super.key,
    required this.onTap,
    required this.user,
    required this.onHorizontalDragDown,
    required this.index,
    required this.chatMessage,
  });

  final int index;
  final bool user;
  final void Function() onTap;
  final void Function(DragEndDetails) onHorizontalDragDown;

  final ChatMessage chatMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          onHorizontalDragEnd: (details) {
            log(details.localPosition.dx.toString());
            if (details.localPosition.dx > 50) {
              onHorizontalDragDown(details);
            }
          },
          onDoubleTap: () {
            controller.showOptions(true, chatMessage.message_id,
                chatMessage.message, chatMessage.messageType);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal:
                    index == controller.select_index ? controller.padding : 16),
            height: 300,
            width: 255,
            decoration: BoxDecoration(
                color: const Color.fromARGB(33, 0, 0, 0),
                image: DecorationImage(
                    image: NetworkImage(chatMessage.message),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
