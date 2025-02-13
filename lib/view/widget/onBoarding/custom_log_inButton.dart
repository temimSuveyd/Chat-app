import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class log_inButton extends StatelessWidget {
  const log_inButton({
    super.key, required this.text, required this.onTap,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColor.bg_brand_solid),
            child: Center(child: Text(text,style: AppTextStyle.semiBold14_20.copyWith(color: Colors.white),),),
      ),
    );
  }
}
