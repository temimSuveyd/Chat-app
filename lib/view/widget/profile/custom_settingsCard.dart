import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.title,
    required this.iconData, required this.onTap,
  });

  final String title;
  final IconData iconData;
  final 
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: Get.width - 40,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.border_primary, width: 1))),
        child: Row(
          children: [
            Icon(
              iconData,
              color: AppColor.text_secondary,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: AppTextStyle.medium14_20.copyWith(
                  fontWeight: FontWeight.w600,
                  color:  AppColor.text_secondary),
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              color: AppColor.text_secondary,
            )
          ],
        ),
      ),
    );
  }
}
