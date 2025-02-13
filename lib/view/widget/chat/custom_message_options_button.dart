import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';

class Message_Options_Button extends StatelessWidget {
  const Message_Options_Button({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
  });

  final String title;
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColor.bg_brand_solid,
            size: 20,
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: AppColor.bg_brand_solid),
          ),
        ],
      ),
    );
  }
}
