import 'package:calculator_app/button_values.dart';
import 'package:flutter/material.dart';

Color getBtnColor(value) {
  return [Btn.del, Btn.clr].contains(value)
      ? Colors.lightGreen
      : [
          Btn.per,
          Btn.multiply,
          Btn.add,
          Btn.subtract,
          Btn.divide,
          Btn.calculate,
        ].contains(value)
          ? Colors.lightBlue
          : Colors.white;
}
