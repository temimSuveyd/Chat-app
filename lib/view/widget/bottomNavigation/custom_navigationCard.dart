


import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  const NavigationCard({
    super.key, required this.iconData, required this.text, required this.color, required this.onTap, required this.size,
  });
final IconData iconData;
final String text;
final Color color;
final double size;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(children: [
      Icon(iconData,size: size,color:color,),
      Text(text,style: AppTextStyle.ragular12_20.copyWith(color: color),)
      
      
      ],),
    );
  }
}
