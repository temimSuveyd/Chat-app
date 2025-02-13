import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({super.key, required this.stasusrecuest, required this.widget});
final Stasusrecuest stasusrecuest ;
final Widget widget;
  @override
  Widget build(BuildContext context) {
   if (Stasusrecuest.success == stasusrecuest) {
     return  widget;
   } else if (Stasusrecuest.loading == stasusrecuest) {
     return Center(child: LottieBuilder.asset(AppImages.loadingAnimation));
   } else if (Stasusrecuest.noInternet == stasusrecuest){
return Center(child: LottieBuilder.asset(AppImages.noInternet));
   }else if (Stasusrecuest.serverFilur == stasusrecuest){
return Center(child: LottieBuilder.asset(AppImages.noInternet));
   }else {
return const Text("have arror in app");

   }
  }
}