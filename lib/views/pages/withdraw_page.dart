import 'package:cryptoapp/Services/http_service.dart';
import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/views/widgets/portfolio_image.dart';
import 'package:cryptoapp/views/widgets/portfolio_refreshed_widget.dart';
import 'package:cryptoapp/views/widgets/rate_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithDrawPage extends StatefulWidget {
  const WithDrawPage({super.key});

  @override
  State<WithDrawPage> createState() => _WithDrawPageState();
}

class _WithDrawPageState extends State<WithDrawPage> {
  final CurrencyController currencyController =
      Get.find(tag: 'currencyController');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Here is what is in",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Text(
            " your portfolio!",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          PortfolioRefreshed(),
          RateTileWidget(
            icon: AssetConstants.btc,
            title: "Bitcoin BTC",
              rate:
                  "${formatLongDoubleWithCommas(currencyController.btcthWallet)} BTC"
          ),
          RateTileWidget(
            icon: AssetConstants.eth,
            title: "Ethereum ETH",
            rate:
                "${formatLongDoubleWithCommas(currencyController.ethWallet)} ETH",
          ),
          RateTileWidget(
            icon: AssetConstants.usdt,
            title: " Tether USDT",
            rate:
                "${formatLongDoubleWithCommas(currencyController.usdtWallet)} USDT",
          ),
        ],
      ),
    );
  
  }
}
