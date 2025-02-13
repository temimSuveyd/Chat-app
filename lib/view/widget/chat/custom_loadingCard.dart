
import 'package:chat_app/core/constanst/color.dart';
import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
                    
                  
          backgroundColor: AppColor.bg_tertiarty,
          color: AppColor.bg_brand_solid,
        ),
      );
  }
}
