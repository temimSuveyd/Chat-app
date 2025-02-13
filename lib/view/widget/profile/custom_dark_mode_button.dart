
import 'package:chat_app/controller/profileController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Switched_setting_button extends StatelessWidget {
  const Switched_setting_button({
    super.key, required this.value, required this.onChanged, required this.title, required this.iconData,
  });

  final bool value;
  final Function(bool) onChanged;
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              color:  AppColor.text_secondary,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: AppTextStyle.medium14_20.copyWith(
                  fontWeight: FontWeight.w600,
                  color:AppColor.text_secondary ),
            ),
            const Spacer(),
            GetBuilder<ProfileControllerImp>(
              builder: (controller) => Switch(
                activeColor: AppColor.bg_brand_solid,
                value: value,
                onChanged: (value) {
                  onChanged(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
