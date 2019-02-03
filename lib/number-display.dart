import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  NumberDisplay({this.value: ''});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ));
  }
}
