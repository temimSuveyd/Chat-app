import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class textField extends StatelessWidget {
  const textField(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.keyboardType,
      required this.controller,
      required this.enabled,
      required this.color,
      required this.onTap,
      required this.obMediaPicke});
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool enabled;
  final Color color;
  final void Function() onTap;
  final void Function() obMediaPicke;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.74,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          onTap: () {
            onTap();
          },
    
          maxLines: 10,
          minLines: 1,
          enabled: enabled,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: AppTextStyle.ragular12_20.copyWith(color: AppColor.text_quarterary),
          decoration: InputDecoration(
            prefixIcon: IconButton(
                onPressed: () {
                  obMediaPicke();
                },
                icon: Icon(Icons.image_outlined)),
            fillColor: color,
            filled: true,
            hintText: hintText,
            hintStyle: AppTextStyle.ragular12_20
                .copyWith(color: AppColor.text_quarterary),
              
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
