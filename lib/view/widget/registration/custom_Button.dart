import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {
  const Custom_button({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: AppColor.bg_brand_solid,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          text,
          style: AppTextStyle.semiBold14_20.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
