import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;
  
  const calculationButtons = [
    ['7', '8', '9', Calculations.DIVIDE],
    ['4', '5', '6', Calculations.MULTIPLY],
    ['1', '2', '3', Calculations.SUBTRACT],
    [Calculations.PERIOD, '0', '00', Calculations.ADD],
    [Calculations.CLEAR, Calculations.EQUAL]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for(var row in calculationButtonRows) CalculatorRow(buttons: row, onTap: onTap),
      ],
    );
  }
}
