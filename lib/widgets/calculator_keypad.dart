import 'package:flutter/material.dart';
import 'package:calculator_app/constants/button_values.dart';
import 'package:calculator_app/widgets/calculator_button.dart';

class CalculatorKeypad extends StatelessWidget {
  final Function(String) onButtonTap;

  const CalculatorKeypad({
    required this.onButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Wrap(
      children: Btn.buttonValues.map(
        (value) {
          Color backgroundColor;
          switch (value) {
            case Btn.del:
              backgroundColor = const Color.fromARGB(255, 252, 164, 32);
              break;
            case Btn.clr:
              backgroundColor = const Color.fromARGB(255, 252, 164, 32);
              break;
            case Btn.per:
              backgroundColor = const Color.fromARGB(255, 252, 164, 32);
              break;
            case Btn.calculate:
              backgroundColor = const Color.fromARGB(255, 243, 222, 33);
            case Btn.add:
              backgroundColor = const Color.fromARGB(255, 243, 222, 33);
              break;
            case Btn.subtract:
              backgroundColor = const Color.fromARGB(255, 243, 222, 33);
              break;
            case Btn.multiply:
              backgroundColor = const Color.fromARGB(255, 243, 222, 33);
              break;
            case Btn.divide:
              backgroundColor = const Color.fromARGB(255, 243, 222, 33);
              break;
            case Btn.dot:
              backgroundColor = const Color.fromARGB(255, 252, 164, 32);
            default:
              backgroundColor = Colors.white;
          }
          return SizedBox(
            width:
                value == Btn.n0 ? screenSize.width / 2 : (screenSize.width / 4),
            height: screenSize.width / 5,
            child: CalculatorButton(
              value: value,
              onTap: () => onButtonTap(value),
              backgroundColor: backgroundColor,
            ),
          );
        },
      ).toList(),
    );
  }
}
