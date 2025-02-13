
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class forgetPasswordButton extends StatelessWidget {
  const forgetPasswordButton({
    super.key, required this.onTap,
  });
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
    "Forgot_your_password".tr,
            style: AppTextStyle.semiBold14_20
                .copyWith(color: AppColor.bg_brand_solid),
          ),
        ],
      ),
    );
  }
}
