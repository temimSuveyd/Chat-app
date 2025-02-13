import 'package:flutter/material.dart';

class ProfileModel {
  

  final String ? text;
  final IconData ? icon;
  final Function() ?  onTap;


  ProfileModel(this.text, this.icon ,this.onTap);
}