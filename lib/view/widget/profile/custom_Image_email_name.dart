import 'package:chat_app/controller/profileController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Image_email_name extends StatelessWidget {
  const Image_email_name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(
      builder: (controller) => Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: NetworkImage(controller.userImage == null
                      ? ""
                      : controller.userImage!),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.userName == null ? "" : controller.userName!,
            style: AppTextStyle.bold20_28.copyWith(color: AppColor.text_secondary),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            controller.userEmail == null ? "" : controller.userEmail!,
            style: AppTextStyle.medium12_16
                .copyWith(color: AppColor.text_quarterary, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
