import 'package:flutter/material.dart';
class ScreenWidthUtil {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
class ScreenHeightUtil {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
