class Currency {
  List<String> dates;
  List<num> values;
  Currency({
    required this.dates,
    required this.values,
  });
  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        dates: List<String>.from(json["dates"].map((x) => x)),
        values: List<num>.from(json["values"].map((x) => x)),
      );
  Map<String, dynamic> toJson() => {
        "dates": List<dynamic>.from(dates.map((x) => x)),
        "values": List<dynamic>.from(values.map((x) => x)),
      };
}

getDummyCurrencyUSD() {
  return Currency(dates: [
    "September 22",
    "October 22",
    "November 22",
    "December 22",
    "January 23",
  ], values: [
    178.0,
    145.0,
    1000.0,
    867.0,
    456.0,
  ]);
}

getDummyCurrencyEUR() {
  return Currency(dates: [
    "September 22",
    "October 22",
    "November 22",
    "December 22",
    "January 23",
  ], values: [
    222.0,
    45.0,
    10.0,
    86.0,
    56.0,
  ]);
}

getDummyCurrencyGBP() {
  return Currency(dates: [
    "September 22",
    "October 22",
    "November 22",
    "December 22",
    "January 23",
  ], values: [
    322.0,
    245.0,
    210.0,
    386.0,
    556.0,
  ]);
}
