import 'package:chat_app/controller/profileController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/widget/profile/custom_Image_email_name.dart';
import 'package:chat_app/view/widget/profile/custom_editProfileButton.dart';
import 'package:chat_app/view/widget/profile/custom_settingsCardContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ProfileControllerImp(),
    );

    return GetBuilder<ProfileControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: HandlingDataView(
            stasusrecuest: controller.stasusrecuest,
            widget: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Image_email_name(),
                        const SizedBox(
                          height: 20,
                        ),
                        EditProfileButton(
                          onTap: () {
                            controller.goToEditProfilepage();
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SettingsListview(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
