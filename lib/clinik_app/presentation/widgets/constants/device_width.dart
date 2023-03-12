import 'package:flutter/material.dart';

class Constants {
  static double? deviceWidth;

  static void init(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
  }
}
