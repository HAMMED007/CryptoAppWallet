import 'package:cryptoapp/Model/currency.dart';

class Currencies {
  Currency usd = Currency(dates: [], values: []);
  Currency eur;
  Currency cad;
  Currency cny;
  String dateTime;
  Currency gbp;
  Currencies(
      {required this.usd,
      required this.dateTime,
      required this.eur,
      required this.cad,
      required this.cny,
      required this.gbp});
}

Currencies getEmptyCurrencies() {
  return Currencies(
      dateTime: "",
      usd: Currency(dates: [], values: []),
      eur: Currency(dates: [], values: []),
      cad: Currency(dates: [], values: []),
      cny: Currency(dates: [], values: []),
      gbp: Currency(dates: [], values: []));
}
