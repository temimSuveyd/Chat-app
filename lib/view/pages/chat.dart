
import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/chat/custom_Redirection_Card.dart';
import 'package:chat_app/view/widget/chat/custom_chatListViewBuilder.dart';
import 'package:chat_app/view/widget/chat/custom_message_options.dart';
import 'package:chat_app/view/widget/chat/custom_writeMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/chat/custom_appBar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChatControllerImp());
    return GetBuilder<ChatControllerImp>(
      builder: (controller) => HandlingDataView(
        stasusrecuest: controller.stasusrecuest,
        widget: Scaffold(
            backgroundColor: AppColor.background,
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              shadowColor: const Color.fromARGB(44, 0, 0, 0),
              elevation: 2,
              automaticallyImplyLeading: false,
              toolbarHeight: 50,
              backgroundColor: AppColor.background,
              actions: CustomAppBar(controller),
            ),
            body: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  ChatListViewBuilder(),
                  controller.redirection_massege_sts
                      ? Redirection_Card(
                        messageType: controller.messageType!,
                          title: controller.redirection_massege,
                          onPressed: () {
                            controller.redirectionCanel();
                          },
                        )
                      : SizedBox(),
                  controller.show_options
                      ? Message_Options(
                          download: () {
                            controller.saveMedyaTogalery(controller.message_id!,
                                controller.message!, controller.messageType!);
                          },
                          messageType: controller.messageType!,
                          copy: () {
                            controller.copy_message(
                                controller.message_id!, controller.message!);
                          },
                        
                          share: () {
                            controller.share_message(
                                controller.message_id!, controller.message!);
                          },
                          delete: () {
                            controller.delete_message(controller.message_id!);
                            controller.hidenOptions();
                          },
                        )
                      : SizedBox(),
                  WriteMessage(),
                ],
              ),
            )),
      ),
    );
  }
}
