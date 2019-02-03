import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CalculatorRow(
            buttons: ['7', '8', '9', Calculations.DIVIDE], onTap: onTap),
        CalculatorRow(
            buttons: ['4', '5', '6', Calculations.MULTIPLY], onTap: onTap),
        CalculatorRow(
            buttons: ['1', '2', '3', Calculations.SUBTRACT], onTap: onTap),
        CalculatorRow(
            buttons: [Calculations.PERIOD, '0', '00', Calculations.ADD],
            onTap: onTap),
        CalculatorRow(
            buttons: [Calculations.CLEAR, Calculations.EQUAL], onTap: onTap),
      ],
    );
  }
}
