import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class ChatBoxPopupMenuItem extends StatelessWidget {
  const ChatBoxPopupMenuItem({

    super.key, required this.iconData, required this.title,required this.isLike
  });

  final IconData iconData ;
  final String title ;
final bool isLike ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(36, 158, 158, 158),
          ),
          width: 30,
          height: 30,
          child:  Icon(
           iconData,
            size: 25,
            color: isLike ? Colors.red :Colors.black54 ,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
      title,
          style: AppTextStyle.semiBold14_20,
        )
      ],
    );
  }
}
