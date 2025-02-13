import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class AddToMyUsersButton extends StatelessWidget {
  const AddToMyUsersButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: 40,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.bg_brand_solid),
          child: Center(
            child: Text(
              "Add",
              style: AppTextStyle.medium12_16.copyWith(color: Colors.white),
            ),
          ),
        ));
  }
}
