import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_AppBar extends StatelessWidget {
  const Custom_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          SizedBox(
            width: 25,
            height: 25,
            child: Image(image: AssetImage(AppImages.logo)),),
            SizedBox(width: 10),
              Text(
                "chati".tr,
                style: AppTextStyle.bold20_28.copyWith(color: AppColor.text_secondary),
              ),
            ],
          )),
    );
  }
}
