import 'package:chat_app/data/models/messageModel.dart';
import 'package:chat_app/view/widget/chat/custom_Redirectiond_video_Card.dart';
import 'package:chat_app/view/widget/chat/custom_redirectiond_image_Card.dart';
import 'package:chat_app/view/widget/chat/custo_redirectiondTextCard.dart';
import 'package:chat_app/view/widget/chat/custom_imageChatBox.dart';
import 'package:chat_app/view/widget/chat/custom_redirectiond_voise_card.dart';
import 'package:chat_app/view/widget/chat/custom_textChatBox.dart';
import 'package:chat_app/view/widget/chat/custom_videoChatBox.dart';
import 'package:chat_app/view/widget/chat/custom_voiseChatBox.dart';

import 'package:flutter/material.dart';

class HandlingMessageType extends StatelessWidget {
  const HandlingMessageType({
    super.key,
    required this.chatMessage,
    r,
    required this.user,
    required this.onDelete,
    required this.onViewe,
    required this.voise,
    required this.is_playe,
    required this.onHorizontalDragDown,
    required this.index,
  });
  final bool user;
  final bool is_playe;
  final int index;
  final Function() onDelete;
  final Function() onViewe;
  final Function() voise;
  final ChatMessage chatMessage;
  final void Function(DragEndDetails) onHorizontalDragDown;

  @override
  Widget build(BuildContext context) {
    if (chatMessage.messageType == "text" &&
        chatMessage.redirectiond == false) {
      return TextChatx(
        chatMessage: chatMessage,
        index: index,
        onHorizontalDragDown: (p0) {
          onHorizontalDragDown(p0);
        },
        user: user,
      );
    } else if (chatMessage.messageType == "image" &&
        chatMessage.redirectiond == false) {
      return ImageChatBox(
        chatMessage: chatMessage,
        index: index,
        onHorizontalDragDown: (p0) {
          onHorizontalDragDown(p0);
        },
        onTap: () {
          onViewe();
        },
        user: user,
      );
    } else if (chatMessage.messageType == "video" &&
        chatMessage.redirectiond == false) {
      return VideoChatBox(
        chatMessage: chatMessage,
        index: index,
        onHorizontalDragDown: (p0) {
          onHorizontalDragDown(p0);
        },
        onTap: () {
          onViewe();
        },
        user: user,
      );
    } else if (chatMessage.messageType == "voise" &&
        chatMessage.redirectiond == false) {
      return VoiseChatBox(
        chatMessage: chatMessage,
        index: index,
        onHorizontalDragDown: (p0) {
          onHorizontalDragDown(p0);
        },
        user: user,
        is_playe: is_playe,
        onTap: () {},
      );
    } else if (chatMessage.messageType == "text" &&
        chatMessage.redirectiond == true) {
      return RedirectiondTextCard(
        user: user,
        chatMessage: chatMessage,
      );
    } else if (chatMessage.messageType == "image" &&
        chatMessage.redirectiond == true) {
      return RedirectiondImageCard(
        chatMessage: chatMessage,
        user: user,
      );
    } else if (chatMessage.messageType == "video" &&
        chatMessage.redirectiond == true) {
      return RedirectiondVideoCard(
        chatMessage: chatMessage,
        user: user,
      );
    } else if (chatMessage.messageType == "voise" &&
        chatMessage.redirectiond == true) {
      return RedirectiondVoiseCard(
        chatMessage: chatMessage,
        user: user,
      );
    }else {
      return SizedBox();
    }
  }
}
