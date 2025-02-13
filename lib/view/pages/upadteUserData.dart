import 'package:chat_app/controller/updateUserController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';

import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/core/function/validator_input.dart';
import 'package:chat_app/view/widget/registration/custom_Button.dart';
import 'package:chat_app/view/widget/updateUerData.dart/custom_appBar.dart';
import 'package:chat_app/view/widget/updateUerData.dart/custom_textField.dart';
import 'package:chat_app/view/widget/updateUerData.dart/set_profile_image_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/updateUerData.dart/textBody.dart';

class UpdateUserDataPage extends StatelessWidget {
  const UpdateUserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => UpdateUserControllerImp(),
    );
    return Scaffold(
        backgroundColor:  AppColor.background,
        body: GetBuilder<UpdateUserControllerImp>(
            builder: (controller) => HandlingDataView(
                  stasusrecuest: controller.stasusrecuest,
                  widget: Form(
                    key: controller.formState,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.log_in_background))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const CustomAppBar(),
                            const Spacer(
                              flex: 1,
                            ),
                             TextBoy(
                              title: "Edit_Your_Data".tr,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            set_profile_image_button(
                              imageStats: controller.imageStats,
                              image: controller.user_image!,
                              onTap: () {
                                controller.pickedImage();
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            textField(
                                hintText: "Last_Name".tr,
                                validator: (p0) {
                                  return validatorInput(p0!, 2, 15, "name");
                                },
                                keyboardType: TextInputType.name,
                                controller: controller.name),
                            const SizedBox(
                              height: 24,
                            ),
                            Custom_button(
                              text:"Update".tr,
                              onTap: () {
                                if (controller.status) {
                                  controller.updateData();
                                }
                              },
                            ),
                            const Spacer(
                              flex: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
