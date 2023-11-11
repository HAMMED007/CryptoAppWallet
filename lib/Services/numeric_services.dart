bool isNumeric(String str) {
  try {
    var value = double.parse(str);
    return true;
  } on FormatException {
    return false;
  }
}

String convertToTwoDigits(String value) {
  if (isNumeric(value)) {
    double val = double.parse(value);
    return val.toStringAsFixed(2);
  }
  return "";
}
