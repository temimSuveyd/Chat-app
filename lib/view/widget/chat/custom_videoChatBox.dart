import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/data/models/messageModel.dart';
import 'package:chat_app/view/widget/chat/Custom_PopupMenuButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoChatBox extends StatelessWidget {
  const VideoChatBox({
    super.key,
    required this.onTap,
    required this.user,
    required this.onHorizontalDragDown, required this.index, required this.chatMessage, 
  });

  final bool user;
  final int index;
  final void Function() onTap;
  final void Function(DragEndDetails) onHorizontalDragDown;
 final ChatMessage chatMessage ;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(
      builder: (controller) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.localPosition.dx > 50) {
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
            Stack(
              clipBehavior: Clip.none,
              children: [
                Custom_PopupMenuButton(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: index == controller.select_index
                                ? controller.padding
                                : 16),
                        width: 255,
                        height: 300,
                        decoration: BoxDecoration(
                            color: AppColor.bg_diabled,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              onTap();
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )),
                    message_id: chatMessage.message_id),
                Positioned(
                    child: Text(
                      chatMessage.emoji,
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
