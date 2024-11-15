import 'package:calculator_app/services/calculator_services.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/models/calculator_state.dart';

import 'package:calculator_app/widgets/calculator_display.dart';
import 'package:calculator_app/widgets/calculator_keypad.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _calculatorService = CalculatorService();
  final _state = CalculatorState();

  void _onButtonTap(String value) {
    setState(() {
      final newState = _calculatorService.handleInput(_state, value);
      _state.number1 = newState.number1;
      _state.operand = newState.operand;
      _state.number2 = newState.number2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Column(
            children: [
              CalculatorDisplay(displayValue: _state.displayValue),
              CalculatorKeypad(onButtonTap: _onButtonTap),
            ],
          ),
        ),
      ),
    );
  }
}
