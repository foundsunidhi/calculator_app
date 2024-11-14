import 'package:calculator_app/models/calculator_state.dart';
import 'package:calculator_app/constants/button_values.dart';

class CalculatorService {
  CalculatorState calculateResult(CalculatorState currentState) {
    if (currentState.number1.isEmpty ||
        currentState.operand.isEmpty ||
        currentState.number2.isEmpty) {
      return currentState;
    }

    final double num1 = double.parse(currentState.number1);
    final double num2 = double.parse(currentState.number2);
    var result = 0.0;

    switch (currentState.operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
    }

    String resultStr = result.toString();
    if (resultStr.endsWith(".0")) {
      resultStr = resultStr.substring(0, resultStr.length - 2);
    }

    return currentState.copyWith(
      number1: resultStr,
      operand: "",
      number2: "",
    );
  }

  CalculatorState handleInput(CalculatorState currentState, String value) {
    switch (value) {
      case Btn.del:
        return _delete(currentState);
      case Btn.clr:
        return CalculatorState();
      case Btn.per:
        return _convertToPercentage(currentState);
      case Btn.calculate:
        return calculateResult(currentState);
      default:
        return _appendValue(currentState, value);
    }
  }

  CalculatorState _delete(CalculatorState currentState) {
    if (currentState.number2.isNotEmpty) {
      return currentState.copyWith(
        number2:
            currentState.number2.substring(0, currentState.number2.length - 1),
      );
    } else if (currentState.operand.isNotEmpty) {
      return currentState.copyWith(operand: "");
    } else if (currentState.number1.isNotEmpty) {
      return currentState.copyWith(
        number1:
            currentState.number1.substring(0, currentState.number1.length - 1),
      );
    }
    return currentState;
  }

  CalculatorState _convertToPercentage(CalculatorState currentState) {
    if (currentState.number1.isEmpty) return currentState;

    var state = currentState;
    if (state.operand.isNotEmpty && state.number2.isNotEmpty) {
      state = calculateResult(state);
    }

    if (state.operand.isNotEmpty) return state;

    final number = double.parse(state.number1);
    return state.copyWith(
      number1: "${(number / 100)}",
      operand: "",
      number2: "",
    );
  }

  CalculatorState _appendValue(CalculatorState currentState, String value) {
    if (value != Btn.dot && int.tryParse(value) == null) {
      if (currentState.operand.isNotEmpty && currentState.number2.isNotEmpty) {
        final newState = calculateResult(currentState);
        return newState.copyWith(operand: value);
      }
      return currentState.copyWith(operand: value);
    }

    if (currentState.number1.isEmpty || currentState.operand.isEmpty) {
      if (value == Btn.dot && currentState.number1.contains(Btn.dot)) {
        return currentState;
      }
      String newValue = value;
      if (value == Btn.dot &&
          (currentState.number1.isEmpty || currentState.number1 == Btn.dot)) {
        newValue = "0.";
      }
      return currentState.copyWith(number1: currentState.number1 + newValue);
    }

    if (currentState.number2.isEmpty || currentState.operand.isNotEmpty) {
      if (value == Btn.dot && currentState.number2.contains(Btn.dot)) {
        return currentState;
      }
      String newValue = value;
      if (value == Btn.dot &&
          (currentState.number2.isEmpty || currentState.number2 == Btn.dot)) {
        newValue = "0.";
      }
      return currentState.copyWith(number2: currentState.number2 + newValue);
    }

    return currentState;
  }
}
