import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String displayValue;

  const CalculatorDisplay({
    required this.displayValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(16),
          child: Text(
            displayValue,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
