import 'package:flutter/material.dart';

abstract class MySize {
  static double fromDouble(BuildContext context, double givenSize) {
    var kHeight = MediaQuery.of(context).size.height;
    var tempSize = (kHeight * givenSize) / 812;
    return tempSize;
  }
}
