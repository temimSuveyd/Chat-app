import 'package:chat_app/controller/homeController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/data/models/chatRoomModel.dart';
import 'package:chat_app/view/widget/home/custom_delete_chat_buttomSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCard extends GetView<HomeControllerImp> {
  const ChatCard({
    super.key,
    required this.onTap,
    required this.chatRoomsModel,
    required this.delete,
  });

  final ChatRoomsModel chatRoomsModel;
  final void Function() onTap;
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MaterialButton(
        onPressed: () {
          onTap();
        },
        onLongPress: () {
          Dele_Block_ButtomSeet(context, delete);
        },
        padding: EdgeInsets.all(0),
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColor.bg_tertiarty,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: NetworkImage(
                        controller.appService.sharedPreferences
                                    .getString("user_email") ==
                                chatRoomsModel.email![0]
                            ? chatRoomsModel.to_avatar!
                            : chatRoomsModel.from_avatar!,
                      ),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.appService.sharedPreferences
                              .getString("user_email") ==
                          chatRoomsModel.email![0]
                      ? chatRoomsModel.to_name!
                      : chatRoomsModel.from_name!,
                  style: AppTextStyle.bold20_28.copyWith(
                      color: AppColor.text_secondary,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: Get.width * 0.6,
                  height: 15,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    chatRoomsModel.last_msg!,
                    style: AppTextStyle.medium12_16.copyWith(
                      color: AppColor.text_quarterary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
