import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';

class MediaTypeButton extends StatelessWidget {
  const MediaTypeButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });
  final void Function() onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.bg_tertiarty,
          ),
          child: Row(
            children: [
              Center(
                child: Text(text),
              ),
              const Spacer(),
              Icon(
                icon,
                color: Colors.grey,
              ),
            ],
          )),
    );
  }
}
