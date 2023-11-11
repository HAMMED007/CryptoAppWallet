import 'package:cryptoapp/Services/numeric_services.dart';

class PriceChange {
  final String price;
  final String lastBid;
  final String percent;

  PriceChange(
      {required this.lastBid, required this.price, required this.percent});

  factory PriceChange.fromJson(Map<String, dynamic> json) {
    return PriceChange(
        price: convertToTwoDigits(json['priceChange']),
        lastBid: convertToTwoDigits(json['lastPrice']),
        percent: convertToTwoDigits(json['priceChangePercent']));
  }
}
