import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPopupMenu extends GetView<ChatControllerImp> {
  const CustomPopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ChatControllerImp(),
    );
    return PopupMenuButton(
      constraints: const BoxConstraints(),
      splashRadius: 10,
      menuPadding: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      color: AppColor.background,
      itemBuilder: (context) => [
        PopupMenuItem(
            onTap: () {
              controller.deleteChat();
            },
            child: Container(
              width: 100,
              child: Text("Delete_Chat".tr,style: AppTextStyle.ragular12_20.copyWith(color: AppColor.text_secondary),),
            )),
      ],
      child: Icon(
        Icons.more_vert,
        color:AppColor.bg_brand_solid,
        size: 30,
      ),
    );
  }
}
