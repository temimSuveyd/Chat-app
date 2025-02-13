import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.controller,
  });
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        style: AppTextStyle.ragular12_20,
        decoration: InputDecoration(
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
