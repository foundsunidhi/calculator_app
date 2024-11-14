import 'package:flutter/material.dart';
import 'package:calculator_app/constants/button_values.dart';

class CalculatorTheme {
  static Color getButtonColor(String value) {
    if (value == Btn.del) {
      return Colors.orange;
    }
    if (value == Btn.clr) {
      return Colors.orange;
    }
    if (value == Btn.per ||
        value == Btn.multiply ||
        value == Btn.add ||
        value == Btn.subtract ||
        value == Btn.divide ||
        value == Btn.calculate) {
      return Colors.lightBlue;
    }
    return Colors.white;
  }
}
