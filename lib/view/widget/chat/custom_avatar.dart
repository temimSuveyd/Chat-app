import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatControllerImp>(
      builder: (controller) => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      controller.avatar == null ? "" : controller.avatar!),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(84, 158, 158, 158),
            ),
            width: 40,
            height: 40,
          ),
          controller.user_stats == true
              ? Positioned(
                  bottom: 1,
                  right: -1,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColor.bg_brand_solid),
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}
