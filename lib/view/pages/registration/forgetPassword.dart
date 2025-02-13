import 'package:chat_app/controller/registration/forgetPasswordController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/core/function/validator_input.dart';
import 'package:chat_app/view/widget/registration/custom_Button.dart';
import 'package:chat_app/view/widget/registration/custom_textBody.dart';
import 'package:chat_app/view/widget/registration/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor:  AppColor.background,
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataView(
                stasusrecuest: controller.stasusrecuest,
                widget: Form(
                  key: controller.formState,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              AppImages.log_in_background,
                            ),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.navigate_before,
                                    size: 35,
                                  ))
                            ],
                          ),
                          const Spacer(flex: 1),
                  TextBoy(
                            title: "Forgot_Password".tr,
                            body: "Send_a_message_to_your_email".tr,
                          ),         
                          const SizedBox(
                            height: 24,
                          ),
                          textField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (p0) {
                              return validatorInput(p0!, 2, 30, "email");
                            },
                            controller: controller.email,
                        hintText: "hintText".tr,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Custom_button(
                        text: "Send".tr,
                            onTap: () {
                              controller.sendPassword();
                            },
                          ),
                          const Spacer(flex: 5),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
