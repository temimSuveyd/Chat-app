import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class PopupMenuItem_card extends StatelessWidget {
  const PopupMenuItem_card({
    super.key, required this.title, required this.iconData,
  });


final String title ;
final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide())),
      height: 50,
      child: Row(
        children: [
          Text(
          title,
            style: AppTextStyle.semiBold14_20
                .copyWith(color: AppColor.text_secondary),
          ),
          const Spacer(),
          Icon(
           iconData,
            color: AppColor.text_secondary,
          ),
        ],
      ),
    );
  }
}