import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/localization/LocalController.dart';
import 'package:chat_app/data/datascore/static/language.dart';
import 'package:chat_app/view/widget/language/custom_language_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language_ListView extends StatelessWidget {
  const Language_ListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controller) => ListView.builder(
        itemCount: languageData.length,
        itemBuilder: (context, index) => Language_Card(
          color: index == controller.lang_index ? AppColor.text_secondary : Colors.transparent,
          onPressed: () {
            controller.changeLang(languageData[index].langCode!,index);
          },
          title: languageData[index].title!,
        ),
      ),
    );
  }
}
