import 'package:flutter/material.dart';
import 'package:calculator_app/constants/button_values.dart';
import 'package:calculator_app/widgets/calculator_button.dart';

class CalculatorKeypad extends StatelessWidget {
  final Function(String) onButtonTap;

  const CalculatorKeypad({
    required this.onButtonTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Wrap(
      children: Btn.buttonValues
          .map(
            (value) => SizedBox(
              width: value == Btn.n0
                  ? screenSize.width / 2
                  : (screenSize.width / 4),
              height: screenSize.width / 5,
              child: CalculatorButton(
                value: value,
                onTap: () => onButtonTap(value),
                backgroundColor: Colors.white,
              ),
            ),
          )
          .toList(),
    );
  }
}
