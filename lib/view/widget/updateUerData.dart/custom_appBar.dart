import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
      
      IconButton(onPressed: () {
        Get.back();
      }, icon: const Icon(Icons.navigate_before, size: 30,))
      
      
      
      ],),
    );
  }
}
