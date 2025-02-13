  import 'package:chat_app/view/widget/registration/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> Custom_diolog(String title , String middleText) {
    return Get.defaultDialog(
            title:title,
            middleText:middleText,
            actions: [
              const SizedBox(
                height: 30,
              ),
              Custom_button(
                text: "OK",
                onTap: () {
                  Get.back();
                },
              ),
            ]);
  }