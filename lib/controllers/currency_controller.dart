import 'package:cryptoapp/Model/crypto_values.dart';
import 'package:cryptoapp/Model/currencies.dart';
import 'package:cryptoapp/Model/currency.dart';
import 'package:cryptoapp/Services/http_service.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  RxInt selectedNavigationIndex = 0.obs;
  RxString usdt = "Loading...".obs;
  RxString btc = "Loading...".obs;
  RxString eth = "Loading...".obs;
  RxString walletPrice = "Loading...".obs;

  double ethVal = 1.0;
  double ethWallet = 2.34;
  double btcthWallet = 0.920;
  double usdtWallet = 156.0;
  double btcVal = 1.0;
  double usdtVal = 1.0;
  bool isValuesLoading = false;

  @override
  Future<void> onInit() async {
    await loadPrices();
    super.onInit();
  }

  loadPrices() async {
    CryptoValues averagedValues = await loadAveragedData();

    usdtVal = averagedValues.usdt;
    btcVal = averagedValues.btc;
    ethVal = averagedValues.eth;
    walletPrice.value = getWalletPrice();
    print(walletPrice.value);
    usdt.value = formatLongDoubleWithCommas(averagedValues.usdt);
    btc.value = formatLongDoubleWithCommas(averagedValues.btc);
    eth.value = formatLongDoubleWithCommas(averagedValues.eth);
  }

  String getWalletPrice() {
    double portffolio = 0;
    if (isValuesLoading = false) {
      return "Loading...";
    } else {
      final btc = btcVal * btcthWallet;
      final eth = ethVal * ethWallet;
      final usdt = usdtVal * usdtWallet;
      portffolio = btc + eth + usdt;
      return formatLongDoubleWithCommas(portffolio);
    }
  }

  String getRate(String currency, double value) {
    if (currency == "ETH") {
      return (value * ethVal).toStringAsFixed(2);
    } else if (currency == "USDT") {
      return (value * usdtVal).toStringAsFixed(2);
    }
    return (value * btcVal).toStringAsFixed(2);
  }
}

double convertToDoubleOrDefault(String input, {double defaultVal = 1.0}) {
  try {
    // Try to parse the input string to a double
    double result = double.parse(input);

    // Check if the parsed value is finite
    if (result.isFinite) {
      return result;
    } else {
      // If the parsed value is not finite, return the default value (1)
      return defaultVal;
    }
  } catch (e) {
    // If an exception occurs during parsing, return the default value (1)
    return defaultVal;
  }
}
