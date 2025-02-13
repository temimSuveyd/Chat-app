import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';

class Block_DelteButton extends StatelessWidget {
  const Block_DelteButton({
    super.key,
    required this.iconData,
    required this.text,
     required this.onTap,
    
  });

  final IconData iconData;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin:const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.bg_tertiarty),
        child: Row(
          children: [
            Center(
              child: Text(text),
            ),
            const Spacer(),
            Icon(
              iconData,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
