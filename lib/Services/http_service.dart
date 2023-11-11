import 'dart:convert';

import 'package:cryptoapp/Model/last_bid.dart';
import 'package:cryptoapp/Model/p2p.dart';
import 'package:cryptoapp/Model/price_change.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class HttpService {
  final String postsURL =
      "https://localbitcoins.com/buy-bitcoins-online/ng/nigeria/national-bank-transfer/.json";

  Future<String> getP2PBuy() async {
    await getP2P();
    String url =
        "https://localbitcoins.com/buy-bitcoins-online/ng/nigeria/national-bank-transfer/.json";
    final response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);

    // print(results['data']['ad_list'][0]['data']['temp_price']);
    return results['data']['ad_list'][0]['data']['temp_price'];
  }

  Future<P2PModel> getP2P() async {
    String url = "https://api.luno.com/api/1/tickers";
    final response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);
    P2PModel p2PModel = P2PModel(p2pBuy: "Loading...", p2pSell: "Loading...");
    print(" P2PBID is:${results['tickers'].length}");
    for (int i = 0; i < results['tickers'].length; i++) {
      if (results['tickers'][i]['pair'] == "XBTNGN") {
        print(" P2PBID is:${results['tickers'][i]['bid']}");
        p2PModel.p2pBuy = results['tickers'][i]['bid'];
        p2PModel.p2pSell = results['tickers'][i]['ask'];
        return p2PModel;
      }
    }
    return p2PModel;
  }

  Future<String> getP2PSell() async {
    String url =
        "https://localbitcoins.com/sell-bitcoins-online/ng/nigeria/national-bank-transfer/.json";
    final response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);

    // print(results['data']['ad_list'][0]['data']['temp_price']);
    return results['data']['ad_list'][0]['data']['temp_price'];
  }

  Future<LastBid> getFromBinance() async {
    //replace your restFull API here.
    String url = "https://api.binance.com/api/v3/depth?symbol=USDTNGN&limit=1";
    final response = await http.get(Uri.parse(url));

    LastBid lastBid = lastBidFromJson(response.body);

    return lastBid;
  }

  Future<double> getPriceChangeUSDT() async {
    //replace your restFull API here.
    String url = "https://api.binance.com/api/v3/avgPrice?symbol=USDTNGN";

    try {
      final response = await http.get(Uri.parse(url));
      var results = jsonDecode(response.body);
      String btc = results['price'] ?? "0.0";


      return double.parse(btc);
    } catch (e) {
      return 0;
    }
  }

  Future<double> getPriceChangeBTC() async {
    //replace your restFull API here.
    String url = "https://api.binance.com/api/v3/avgPrice?symbol=BTCNGN";
    try {
      final response = await http.get(Uri.parse(url));
      var results = jsonDecode(response.body);
      String btc = results['price'] ?? "0.0";

      // print(priceChange.price);
      // print(priceChange.percent);
      return double.parse(btc);
    } on Exception catch (e) {
      return 0;
    }
  }

  Future<double> getPriceChangeETH() async {
    //replace your restFull API here.
    String url = "https://api.luno.com/api/1/ticker?pair=ETHNGN";

    try {
      final response = await http.get(Uri.parse(url));
      var results = jsonDecode(response.body);
      String btc = results['last_trade'] ?? "0.0";

      final eth = double.parse(btc);

      return eth;
    } on Exception catch (e) {
      return 0;
    }
  }
}

String formatLongDoubleWithCommas(double longDouble) {
  // Convert the long double to a string
  String stringValue = longDouble.toStringAsFixed(2);

  // Split the string into integer and decimal parts
  List<String> parts = stringValue.split('.');

  // Format the integer part with commas
  String formattedIntegerPart = parts[0].replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match match) => '${match.group(0)},',
  );

  // Combine the formatted integer part with the decimal part (if it exists)
  String result = formattedIntegerPart;
  if (parts.length > 1) {
    result += '.' + parts[1];
  }

  return result;
}

