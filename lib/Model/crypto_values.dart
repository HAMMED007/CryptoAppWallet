import 'package:cryptoapp/Model/p2p.dart';
import 'package:cryptoapp/Model/price_change.dart';
import 'package:cryptoapp/Services/http_service.dart';
import 'package:cryptoapp/Services/numeric_services.dart';

class CryptoValues {
  double usdt;
  double btc;
  double eth;

  CryptoValues({
    required this.usdt,
    required this.btc,
    required this.eth,
  });
}

Future<CryptoValues> loadAveragedData() async {
  HttpService httpService = HttpService();
  print("Load average data called");

  final usdt = await httpService.getPriceChangeUSDT();

  final btc = await httpService.getPriceChangeBTC();
  final eth = await httpService.getPriceChangeETH();

  return CryptoValues(usdt: usdt, eth: eth, btc: btc);
}
