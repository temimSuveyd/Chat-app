import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.bg_brand_solid,
        ),
        child: Center(
          child: Text(
          "Edit_Profile".tr,
            style: AppTextStyle.medium14_20.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
