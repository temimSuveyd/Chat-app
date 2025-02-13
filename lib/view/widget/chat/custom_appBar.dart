import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/view/widget/chat/custom_avatar.dart';
import 'package:chat_app/view/widget/chat/custom_popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> CustomAppBar(ChatControllerImp controller) {
  return [
    IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: AppColor.bg_brand_solid,
          size: 25,
        )),
    Avatar(),
    const SizedBox(
      width: 8,
    ),
    Text(
      controller.name!,
      style: AppTextStyle.medium14_20
          .copyWith(color:AppColor.text_secondary, fontWeight: FontWeight.w400),
    ),
    const Spacer(),
    CustomPopupMenu(),
    SizedBox(
      width: 5,
    ),
  ];
}
