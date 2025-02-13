

import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:chat_app/view/widget/chat/Custom_PopupMenuButton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TextChatx extends StatelessWidget {
  const TextChatx({
    super.key,
    required this.user,
    required this.onHorizontalDragDown,
    required this.index,
     required this.chatMessage,
  });
  final bool user;
  final int index;
  final void Function(DragEndDetails) onHorizontalDragDown;
  final
  ChatMessage chatMessage ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(
      builder: (controller) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.localPosition.dx > 100) {
            onHorizontalDragDown(details);
          }
        },
        onDoubleTap: () {
          controller.showOptions(true, chatMessage.message_id, chatMessage.message,chatMessage.messageType);
        },
        child: Column(
          crossAxisAlignment:
              user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Custom_PopupMenuButton(
              message_id: chatMessage.message_id ,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal:
                          index == controller.select_index ? controller.padding : 16),
                  decoration: BoxDecoration(
                    color: user
                        ? AppColor.bg_tertiarty
                        : AppColor.bg_brand_solid,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        chatMessage.message,
                        style: AppTextStyle.semiBold14_20.copyWith(
                            color: user ? AppColor.text_secondary : Colors.white),
                      ),
                      Positioned(left: -15, top: -15, child: Text(chatMessage.emoji)),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
// const Color.fromARGB(255, 207, 207, 207)