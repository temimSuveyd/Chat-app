import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class Language_Card extends StatelessWidget {
  const Language_Card({
    super.key,
    required this.color,
    required this.onPressed,
     required this.title,
  });

  final Color color;
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onPressed();
      },
      color: AppColor.bg_tertiarty,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: color),
          borderRadius: BorderRadius.circular(10)),
      child: Text(title, style: AppTextStyle.semiBold16_24.copyWith(color: AppColor.text_foreground)),
    );
  }
}
