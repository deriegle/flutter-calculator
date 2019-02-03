import 'package:flutter/material.dart';
import 'calculator-button.dart';
import 'calculator.dart';
import 'number-display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _calculator = Calculator();
  List<double> values = [];
  List<String> operations = [];
  String calculatorString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Column(
        children: <Widget>[
          NumberDisplay(value: calculatorString),
          Column(
            children: <Widget>[
              _buildCalculatorRow(['7', '8', '9', Calculations.DIVIDE]),
              _buildCalculatorRow(['4', '5', '6', Calculations.MULTIPLY]),
              _buildCalculatorRow(['1', '2', '3', Calculations.SUBTRACT]),
              _buildCalculatorRow(['.', '0', '00', Calculations.ADD]),
              _buildCalculatorRow([Calculations.CLEAR, Calculations.EQUAL]),
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      )
    );
  }

  Widget _buildCalculatorRow(List<String> buttons) {
    List<Widget> calculatorButtons = [];
    buttons.forEach((String buttonText){
      calculatorButtons.add(_buildCalculatorButton(buttonText));
    });

    return Row(
      children: calculatorButtons,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  CalculatorButton _buildCalculatorButton(String buttonText) {
    return CalculatorButton(
      onTap: _onPressed,
      text: buttonText,
    );
  }

  void _onPressed({String buttonText}) {
    List<String> calculationOperations = [
      Calculations.ADD,
      Calculations.SUBTRACT,
      Calculations.DIVIDE,
      Calculations.MULTIPLY
    ];

    if (calculationOperations.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText);
        calculatorString += " $buttonText ";
      });
    }

    if (buttonText == Calculations.CLEAR) {
      return setState(() {
        operations.add(Calculations.CLEAR);
        calculatorString = "";
      });
    }

    if (buttonText == Calculations.EQUAL) {
      return setState(() {
        operations.add(Calculations.EQUAL);
        calculatorString = _calculator.parseString(calculatorString);
      });
    }

    setState(() {
      if (operations.length > 0 && operations.last == Calculations.EQUAL) {
        calculatorString = buttonText;
      } else {
        calculatorString += buttonText;
      }
    });
  }
}
