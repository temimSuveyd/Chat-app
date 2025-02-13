

import 'package:chat_app/controller/registration/log_inController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Set_profile_image_button extends StatelessWidget {
  const Set_profile_image_button({
    super.key,
    required this.onTap, required this.image_stats,
  });
  final void Function() onTap;
  final bool image_stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "صورة الملف الشخصي",
          style: AppTextStyle.semiBold14_20,
        ),
        const SizedBox(
          height: 12,
        ),
image_stats ? 


        GestureDetector(
          onTap: () {
            onTap();
          },
          child: GetBuilder<Log_inControllerImp>(
            builder: (controller) => Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: AppColor.text_secondary),
                  image: DecorationImage(
                      image: NetworkImage(controller.user_image),
                      fit: BoxFit.cover)),
            ),
          ),
        ) :SizedBox(
                    height: 72,
                    width: 72,
                    child: CircularProgressIndicator(
                      color: AppColor.bg_brand_soli,
                    ))
      ],
    );
  }
}
