import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class TextBoy extends StatelessWidget {
  const TextBoy({
    super.key, required this.title, required this.body,
  });
final String title ;
final String body ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
          Text(title,style: AppTextStyle.bold36_44.copyWith(color: AppColor.text_foreground),),
          Text(body,style: AppTextStyle.ragular12_20.copyWith(color: AppColor.text_secondary),),
        
        ],),
      ],
    );
  }
}