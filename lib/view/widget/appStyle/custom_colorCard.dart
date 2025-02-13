import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });
  final Color color;
  final void Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: MaterialButton(
          onPressed: () {

            onTap();
          },
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  width: 2,
                  color: isSelected
                      ? Colors.transparent
                      : AppColor.text_secondary)),
        )
        );
  }
}
