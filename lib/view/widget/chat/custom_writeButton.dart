
import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';

class WriteButton extends StatelessWidget {
  const WriteButton({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.record,

  });
  final void Function() onTap;


  final IconData iconData;
  final bool record;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: record ? AppColor.bg_brand_solid : Colors.transparent),
            color: AppColor.bg_tertiarty),
        child: Center(
          child: Icon(iconData,color: AppColor.text_quarterary,),
        ),
      ),
    );
  }
}
