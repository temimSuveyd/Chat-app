import 'package:chat_app/controller/navigationBarControler.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/bottomNavigation/custom_navigationCard.dart';
import 'package:chat_app/view/widget/bottomNavigation/custom_newChatButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_NavigationBar extends GetView<NavigationBarControllerImp> {
  const Custom_NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationBarControllerImp());

    return GetBuilder<NavigationBarControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.background,
        bottomNavigationBar: BottomAppBar(
          color: AppColor.background,
          clipBehavior: Clip.antiAlias,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                controller.iconsList.length,
                (index) => index == 1
                    ? const AddButton()
                    : NavigationCard(
                        size: controller.currentPage == index ? 30 : 24,
                        onTap: () {
                          controller.changePage(index);
                        },
                        color: controller.currentPage == index
                            ? AppColor.bg_brand_solid
                            : AppColor.text_quarterary,
                        iconData: controller.iconsList[index]["icon"],
                        text: controller.iconsList[index]["text"],
                      ),
              ),
            ],
          ),
        ),
        body: controller.pages.elementAt(controller.currentPage),
      ),
    );
  }
}
