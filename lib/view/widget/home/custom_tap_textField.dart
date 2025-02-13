import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    required this.onTap,
  });
  final String hintText;
  final TextEditingController controller;

  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextFormField(
        onTap: () {
          onTap();
        },
        controller: controller,
        keyboardType: TextInputType.text,
        style:
            AppTextStyle.ragular12_20.copyWith(color: AppColor.text_disabled),
        decoration: InputDecoration(
          fillColor: AppColor.bg_diabled,
          filled: true,
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: AppTextStyle.ragular12_20
              .copyWith(color: AppColor.text_placeholder_subtle),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColor.border_primary, width: 1.4)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColor.bg_brand_solid, width: 1.4)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.border_error, width: 1.4)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.text_placeholder_subtle)),
        ),
      ),
    );
  }
}
