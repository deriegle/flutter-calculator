class NumberFormatter {
  static String format(String text) {
    double parsedNumber = double.parse(text);

    if ((parsedNumber == parsedNumber.floor()) && (parsedNumber != double.infinity)) {
      return parsedNumber.truncate().toString();
    }

    return text;
  }
}
