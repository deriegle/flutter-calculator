import 'package:flutter_test/flutter_test.dart';

class TestHelper {
  static pressCalculatorButtons(String calculation, WidgetTester tester) async {
    List<String> buttonsToPress = calculation.replaceAll(' ', '').split('');

    for (var buttonText in buttonsToPress) {
      await tester.tap(find.text(buttonText));
    }

    await tester.pump();
  }
}
