import 'package:flutter/material.dart';
import 'calculator.dart';
import 'number-display.dart';
import 'calculator-buttons.dart';
import 'history.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)  => MyHomePage(title: 'Calculator'),
        '/history': (context) => History(),
      },
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History(operations: operations))
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            NumberDisplay(value: calculatorString),
            CalculatorButtons(onTap: _onPressed),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }

  void _onPressed({String buttonText}) {
    if (Calculations.OPERATIONS.contains(buttonText)) {
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

    if (buttonText == Calculations.PERIOD) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
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
