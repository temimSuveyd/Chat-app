import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/home/custom_delete_blockButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> Dele_Block_ButtomSeet(
    BuildContext context, void Function() onDelete) {
  return showModalBottomSheet(
    context: context,
    backgroundColor:AppColor.background,
    builder: (context) => SizedBox(
      height: 200,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Block_DelteButton(
              iconData: Icons.delete,
              text: "Delete",
              onTap: () {
                onDelete();
                Get.back();
              },
            ),
          ],
        ),
      ),
    ),
  );
}
