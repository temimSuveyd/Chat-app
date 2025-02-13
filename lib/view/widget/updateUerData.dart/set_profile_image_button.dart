import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:flutter/material.dart';

class set_profile_image_button extends StatelessWidget {
  const set_profile_image_button({
    super.key,
    required this.onTap,
    required this.image,
    required this.imageStats,
  });
  final void Function() onTap;
  final String image;
  final bool imageStats;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Photo profile",
          style: AppTextStyle.semiBold14_20,
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
            onTap: () {
              onTap();
            },
            child: imageStats
                ? SizedBox(
                    height: 72,
                    width: 72,
                    child: CircularProgressIndicator(
                      color: AppColor.bg_brand_soli,
                    ))
                : Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(color: AppColor.border_secondary),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  ))
      ],
    );
  }
}
