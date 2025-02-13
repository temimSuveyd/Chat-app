import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';


class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.ontap,

  });

  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
                decoration: BoxDecoration(
                    color: AppColor.bg_brand_solid,
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                child: Center(
                  child: Text(
                "Add_User".tr,
                    style:
                        AppTextStyle.ragular12_20.copyWith(color: Colors.white),
                  ),
                ),
              ));
  }
}
