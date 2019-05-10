import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/calculator.dart';

void main() {
  group('Calculations', () {
    test('add', () {
      expect(Calculations.add(105, 105), 210);
    });

    test('subtract', () {
      expect(Calculations.subtract(105, 90), 15);
    });

    test('divide', () {
      expect(Calculations.divide(100, 25), 4);
    });

    test('multiply', () {
      expect(Calculations.multiply(100, 25), 2500);
    });
  });

  group('Calculator', () {
    group('parseString', () {
      test('returns same string when no operations', () {
        expect(Calculator.parseString('2'), '2');
      });

      test('returns correct result based on operation', () {
        expect(Calculator.parseString('4 + 4'), 8.toString());
        expect(Calculator.parseString('6 * 2'), 12.toString());
        expect(Calculator.parseString('100 - 20'), 80.toString());
        expect(Calculator.parseString('100 / 25'), 4.toString());
        expect(Calculator.parseString('-25 + 25'), 0.toString());
      });

      test('parses negative numbers correctly', () {
        expect(Calculator.parseString('-25 - 20'), (-40).toString());
      }, skip: true);

      test('returns same string when given negative number', () {
        expect(Calculator.parseString('-2'), '-2');
      }, skip: true);
    });

    group('addPeriod', () {
      test('when string is empty it returns 0.', () {
        expect(Calculator.addPeriod(''), '0.');
      });

      test('adds a period when number does not have a period', () {
        expect(Calculator.addPeriod('1'), '1.');
        expect(Calculator.addPeriod('1.'), '1.');
        expect(Calculator.addPeriod('1 + 1'), '1 + 1.');
        expect(Calculator.addPeriod('1.0 + 1'), '1.0 + 1.');
        expect(Calculator.addPeriod('1.0 + 1.0'), '1.0 + 1.0');
      });

      test('adds only one period when the first number doesn\'t have one and the second one does', () {
        expect(Calculator.addPeriod('10 + 1.0'), '10 + 1.0');
      }, skip: true);
    });

    group('includesOperation', () {
      Calculations.OPERATIONS.forEach((operation) {
        test('when $operation is in the string', () {
          expect(Calculator.includesOperation('2 $operation 3'), true);
        });
      });

      test('when string does not include operation', () {
        expect(Calculator.includesOperation('2.000'), false);
      });
    });
  });
}
