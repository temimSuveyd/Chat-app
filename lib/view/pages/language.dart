import 'package:chat_app/controller/languageController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/core/localization/LocalController.dart';
import 'package:chat_app/view/widget/language/custom_language_listViewBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => Localcontroller(),

    );
Get.lazyPut(() => LanguageControllerImp(),);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.text_foreground,
          ),
        ),
        title: Text(
"Language".tr,
          style: AppTextStyle.semiBold16_24
              .copyWith(color: AppColor.text_foreground),
        ),
        backgroundColor: AppColor.background,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Language_ListView(),
      ),
    );
  }
}
