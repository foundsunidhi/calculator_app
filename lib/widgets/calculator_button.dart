import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CalculatorButton({
    required this.value,
    required this.onTap,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: backgroundColor,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
