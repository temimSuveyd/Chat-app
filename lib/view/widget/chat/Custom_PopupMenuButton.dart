import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/data/datascore/static/emojis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_PopupMenuButton extends StatelessWidget {
  const Custom_PopupMenuButton({
    super.key,
    required this.child,
    required this.message_id,
  });
  final Widget child;

  final String message_id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(
      builder: (controller) => PopupMenuButton(
        splashRadius: 100,
        constraints: BoxConstraints(
          maxWidth: 350,
        ),
        elevation: 5,
        offset: const Offset(0, 20),
        onOpened: () {
          controller.messageSelected(true);
        },
        onCanceled: (){
 controller.messageSelected(false);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        position: PopupMenuPosition.under,
        menuPadding: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        color: AppColor.background,
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {},
            child: Row(
              children: [
                ...List.generate(
                  5,
                  (index) => TextButton(
                    style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Colors.black12)),
                    onPressed: () {
                      controller.addEmoji(emojiData[index].emoji!,
                          controller.chatRoom_id!, message_id);
                      Get.back();
                    },
                    child: Text(
                      emojiData[index].emoji!,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
