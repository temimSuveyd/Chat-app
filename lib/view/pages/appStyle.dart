import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/view/widget/appStyle/custom_ColorListView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AppStylePage extends StatelessWidget {
  const AppStylePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
backgroundColor: AppColor.background,
title: Text("AppStyle".tr,style: AppTextStyle.semiBold16_24.copyWith(color: AppColor.text_foreground),),


      ),
        backgroundColor:  AppColor.background,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: ColorListViewBuilder(),
        ));
  }
}
