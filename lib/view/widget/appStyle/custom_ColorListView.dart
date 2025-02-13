import 'package:chat_app/controller/appStyleController.dart';
import 'package:chat_app/data/datascore/static/appStyles.dart';
import 'package:chat_app/view/widget/appStyle/custom_colorCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorListViewBuilder extends StatelessWidget {
  const ColorListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AppsTyleControllerImp());
    return GetBuilder<AppsTyleControllerImp>(
      builder: (controller) => ListView.builder(
        itemCount: appSylesData.length,
        itemBuilder: (context, index) => ColorCard(
          isSelected:controller .color_index == index ? false :true,
          onTap: () {
            controller.changeColor(index);
            controller.saveStyle(appSylesData[index].color!);
          },
          color: appSylesData[index].color!,
        ),
      ),
    );
  }
}
