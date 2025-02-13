import 'package:chat_app/controller/homeController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/view/widget/home/custom_mediaTypeButtomSheet.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStoryBtton extends GetView<HomeControllerImp> {
  const AddStoryBtton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        media_type_ButtomSheet(context, controller);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.border_primary),
              borderRadius: BorderRadius.circular(35),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Add Story",
            style: AppTextStyle.ragular10_14,
          ),
        ],
      ),
    );
  }
}
