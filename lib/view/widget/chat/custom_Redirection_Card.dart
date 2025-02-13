import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Redirection_Card extends StatelessWidget {
  const Redirection_Card({
    super.key,
    required this.title,
    required this.onPressed,
    required this.messageType,
  });

  final String title;
  final String messageType;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: AppColor.bg_tertiarty, width: 1))),
        child: Row(
          children: [
            messageType == "text"
                ? SizedBox(
                    width: Get.width - 100,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : SizedBox(
                    width: Get.width - 100,
                    child: Text(
                      "selected medya",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
            Spacer(),
            IconButton(
                onPressed: () {
                  onPressed();
                },
                icon: Icon(
                  Icons.cancel,
                  size: 30,
                )),
          ],
        ));
  }
}
