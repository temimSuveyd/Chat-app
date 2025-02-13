import 'package:chat_app/controller/viewImageController.dart';
import 'package:chat_app/core/constanst/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ViewImagePage extends GetView<ViewImageControllerImp> {
  const ViewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ViewImageControllerImp(),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.background,),
      backgroundColor: const Color.fromARGB(19, 77, 75, 75),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(top: 20, left: 10),
        decoration: BoxDecoration(
            // image: DecorationImage(image: NetworkImage(controller.image!))

            ),
        child: PhotoView(imageProvider: NetworkImage(controller.image!),),
      ),
    );
  }
}
