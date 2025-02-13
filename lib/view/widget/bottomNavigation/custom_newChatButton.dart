import 'package:chat_app/controller/homeController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends GetView<HomeControllerImp> {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToAddUserPage();
      },
      child: Container(
        alignment: Alignment.center,
      
      height: 40,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      color: AppColor.bg_brand_solid,
        
      ),
      child: Text("New_Chat".tr,style: AppTextStyle.medium14_20.copyWith(color: Colors.white),)
      
      
      ),
    );
  }
}

