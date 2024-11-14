class CalculatorState {
  String number1 = "";
  String operand = "";
  String number2 = "";

  String get displayValue =>
      "$number1$operand$number2".isEmpty ? "0" : "$number1$operand$number2";

  CalculatorState copyWith({
    String? number1,
    String? operand,
    String? number2,
  }) {
    return CalculatorState()
      ..number1 = number1 ?? this.number1
      ..operand = operand ?? this.operand
      ..number2 = number2 ?? this.number2;
  }

  void clear() {
    number1 = "";
    operand = "";
    number2 = "";
  }
}
