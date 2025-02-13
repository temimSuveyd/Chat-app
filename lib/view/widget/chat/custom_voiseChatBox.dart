import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:chat_app/view/widget/chat/Custom_PopupMenuButton.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:voice_message_player/voice_message_player.dart';

class VoiseChatBox extends StatelessWidget {
  const VoiseChatBox({
    super.key,
    required this.user,
    required this.is_playe,
    required this.onTap,
     required this.index, required this.onHorizontalDragDown, required this.chatMessage,
  });
  final bool user;
  final bool is_playe;
  final int index;

  final void Function() onTap;
  final void Function(DragEndDetails) onHorizontalDragDown;
 final ChatMessage chatMessage ;
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
          controller.showOptions(true,chatMessage.message_id , chatMessage.message, chatMessage.messageType);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: index == controller.select_index ? controller.padding : 16),
          child: Column(
            crossAxisAlignment:
                user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:
                    user ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Custom_PopupMenuButton(
                          child: VoiceMessagePlayer(
                            activeSliderColor: user
                                ? AppColor.bg_brand_solid
                                : const Color.fromARGB(36, 158, 158, 158),
                            backgroundColor: user
                                ? const Color.fromARGB(36, 158, 158, 158)
                                : AppColor.bg_brand_solid,
                            controller: VoiceController(
                              audioSrc: chatMessage.message,
                              maxDuration: const Duration(seconds: 10),
                              isFile: false,
                              onComplete: () {},
                              onPause: () {},
                              onPlaying: () {},
                            ),
                            innerPadding: 12,
                            cornerRadius: 20,
                          ),
                          message_id: chatMessage.message),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
