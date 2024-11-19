import 'package:calculator_app/screens/calculator_screen1.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.light(),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
