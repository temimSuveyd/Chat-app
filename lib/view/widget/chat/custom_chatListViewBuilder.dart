import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/class/handlingMessageType.dart';
import 'package:chat_app/data/models/messageModel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListViewBuilder extends StatelessWidget {
  const ChatListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(
        builder: (controller) => Expanded(
            child: Obx(() => ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.messagesList.length,
                itemBuilder: (context, index) {
                  return HandlingMessageType(
                    chatMessage: ChatMessage.fromJson(
                        controller.messagesList[index].data()
                            as Map<String, dynamic>,
                      
                        controller.messagesList[index].id),
                    index: index,
                    onHorizontalDragDown: (p0) {
                      controller.changeIndex(index);
                      controller.slideChatBox();
                      controller.redirection(
                          controller.messagesList[index]["message"],
                          controller.messagesList[index]["message_type"],
                        );
                        
                    },
                    user: controller.messagesList[index]["sender"] ==
                        controller.appService.sharedPreferences
                            .getString("user_email"),
                    onDelete: () {
                      controller.delete_message(
                        controller.messagesList[index].id,
                      );
                    },
                    onViewe: () {
                      controller.goToimageView(
                        controller.messagesList[index]["message"],
                        controller.messagesList[index]["message_type"],
                      );
                    },
                    voise: () {
                      if (controller.is_player) {
                        controller.stopVoise();
                        controller.voiseStats(
                            false, controller.messagesList[index].id);
                      } else {
                        controller.playeVoise(
                            controller.messagesList[index]["message"]);
                        controller.voiseStats(
                            true, controller.messagesList[index].id);
                      }
                    },
                    is_playe: controller.messagesList[index]["stats"],
                  );
                }))));
  }
}
