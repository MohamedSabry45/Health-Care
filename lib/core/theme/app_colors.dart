import 'package:flutter/material.dart';

class AppColors{
  static  Color splashScreenBackground=  HexColor("#75A8CD");
  static  Color onBoardingBackground=  Colors.white;
  static  Color primaryColor=  HexColor("#0B66A8");
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}