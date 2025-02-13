import 'package:chat_app/controller/homeController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/home/custom_appBar.dart';
import 'package:chat_app/view/widget/home/custom_chatListView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => HomeControllerImp(),
    );
    return Scaffold(
        backgroundColor: AppColor.background,
        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
            stasusrecuest: controller.stasusrecuest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  const Custom_AppBar(),
                  const ChatRoomsListView(),
                ],
              ),
            ),
          ),
        ));
  }
}
