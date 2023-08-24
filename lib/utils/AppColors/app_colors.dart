import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Color(0xff36d037);// Fixera Color(0xffA0C828);
  static Color searchBoxColor = Color(0xffA0C828);
  static Color bottomNavColor = Color(0xff838383);
  static Color secondaryColor = Color(0xff0E153D);
  static Color backgroundColor = Color(0xffffffff);
  static Color textColorWhite = Color(0xffffffff);
  static Color textColorGrey = Colors.grey;
  static Color textColorGreen=Color(0xff2ECC71);
  static Color textColorBlack=Colors.black;
  static Color textColorRed=Colors.red;
  static Color containerColor=Color(0xffFAFAFA);
  static Color colorBlue=Colors.blue;
  static  Color ccsYelow = HexColor("#EBAE27");
  static  Color ccsGreen = HexColor("#00cc8d");
}
// ccs color #EBAE27
// #00cc8d green

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
