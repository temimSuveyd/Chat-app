import 'package:chat_app/controller/homeController.dart';
import 'package:chat_app/data/models/chatRoomModel.dart';
import 'package:chat_app/view/widget/home/custom_chatCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomsListView extends StatelessWidget {
  const ChatRoomsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Obx(
              () => SliverList.builder(
                itemCount: controller.rooms.length,
                itemBuilder: (context, index) => ChatCard(
                  delete: () {
                    controller.deleteChatRoom(controller.rooms[index].id);
                  },
                  chatRoomsModel:
                      ChatRoomsModel.fromJson(controller.rooms[index]),
                  onTap: () {
                    controller.goToChatRoom(
                        controller.appService.sharedPreferences
                                    .getString("user_email") ==
                                controller.rooms[index]["email"][0]
                            ? controller.rooms[index]["to_name"]
                            : controller.rooms[index]["from_name"],
                        controller.rooms[index]["chatRoom_id"]);
                  },
                ),
              ),
            ));
  }
}
