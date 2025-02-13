import 'package:chat_app/controller/OnBoardingController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/view/widget/onBoarding/custom_log_inButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPage extends GetView<OnBoardingControllerImp> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put( OnBoardingControllerImp());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),

     
            SizedBox(
              height: 240,
              width: 240,
              child: Image.asset(
                AppImages.illustration,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text("Welcome_to_Chaty".tr, style: AppTextStyle.bold20_28.copyWith(color: AppColor.text_foreground)),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 300,
                child: Text(
"Welcome_to_Chaty_ We_are".tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.ragular12_20.copyWith(color: AppColor.text_secondary))),
            const Spacer(
              flex: 3,
            ),
            log_inButton(
              onTap: () {
                controller.goToNextPage();
              },
              text: "Login".tr
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}




