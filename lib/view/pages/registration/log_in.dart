import 'package:chat_app/controller/registration/log_inController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/core/function/validator_input.dart';
import 'package:chat_app/view/widget/registration/custom_Button.dart';
import 'package:chat_app/view/widget/registration/custom_set_profile_image_button.dart';
import 'package:chat_app/view/widget/registration/custom_textBody.dart';
import 'package:chat_app/view/widget/registration/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Log_inPage extends StatelessWidget {
  const Log_inPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => Log_inControllerImp(),
    );
    return Scaffold(
        backgroundColor: AppColor.background,
        body: GetBuilder<Log_inControllerImp>(
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
                        child: ListView(
                          children: [
                            SizedBox(height: 50),
                            TextBoy(
                              title: "Profile_Information".tr,
                              body:
                                  "Please_fill_in_your_profile_information_first"
                                      .tr,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Set_profile_image_button(
                              image_stats: controller.image_stats,
                              onTap: () {
                                controller.pickeImage();
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            textField(
                                hintText: "First_Name".tr,
                                validator: (p0) {
                                  return validatorInput(p0!, 2, 15, "text");
                                },
                                keyboardType: TextInputType.name,
                                controller: controller.firstName),
                            const SizedBox(
                              height: 16,
                            ),
                            textField(
                                hintText: "Last_Name".tr,
                                validator: (p0) {
                                  return validatorInput(p0!, 2, 15, "text");
                                },
                                keyboardType: TextInputType.name,
                                controller: controller.lastName),
                            const SizedBox(
                              height: 16,
                            ),
                            textField(
                                hintText: "Email".tr,
                                validator: (p0) {
                                  return validatorInput(p0!, 2, 15, "email");
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.email),
                            const SizedBox(
                              height: 16,
                            ),
                            textField(
                                hintText: "Password".tr,
                                validator: (p0) {
                                  return validatorInput(p0!, 4, 30, "text");
                                },
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.password),
                            const SizedBox(
                              height: 24,
                            ),
                            Custom_button(
                              text: "Login".tr,
                              onTap: () {
                                if (controller.staus) {
                                  controller.log_in();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("&"),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Custom_button(
                              text: "I_have_an_account".tr,
                              onTap: () {
                                if (controller.staus) {
                                  controller.goToSign_in();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
