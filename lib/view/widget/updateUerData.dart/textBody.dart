import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class TextBoy extends StatelessWidget {
  const TextBoy({
    super.key, required this.title ,
  });
final String title ;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          
          Text(title,style: AppTextStyle.bold36_44,),
      ],
    );
  }
}