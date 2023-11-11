import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/views/pages/withdraw_page.dart';
import 'package:cryptoapp/views/widgets/portfolio_image.dart';
import 'package:cryptoapp/views/widgets/rate_tile_widget.dart';
import 'package:cryptoapp/views/widgets/widthdraw_deposit_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageWidget extends StatefulWidget {
  final String usdtPrice;
  final String btcPrice;
  final String ethPrice;
  final String portfolioPrice;

  const HomePageWidget(
      {super.key,
      required this.usdtPrice,
      required this.btcPrice,
      required this.ethPrice,
      required this.portfolioPrice});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final CurrencyController currencyController =
      Get.find(tag: 'currencyController');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () =>
                  {currencyController.selectedNavigationIndex.value = 1},
              child: Center(
                  child: PortfolioImages(
                value: widget.portfolioPrice,
              ))),
          const Text(
            "Rates!",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const Text(
            "*Rates are updated every minute",
            textAlign: TextAlign.left,
          ),
          RateTileWidget(
            icon: AssetConstants.btc,
            title: "Bitcoin BTC",
            rate: widget.btcPrice == "Loading..."
                ? widget.btcPrice
                : "N ${widget.btcPrice}",
          ),
          RateTileWidget(
            icon: AssetConstants.eth,
            title: "Ethereum ETH",
            rate: widget.ethPrice == "Loading..."
                ? widget.ethPrice
                : "N ${widget.ethPrice}",
          ),
          RateTileWidget(
            icon: AssetConstants.usdt,
            title: " Tether USDT",
            rate: widget.usdtPrice == "Loading..."
                ? widget.usdtPrice
                : "N ${widget.usdtPrice}",
          ),
          const Center(child: WithDrawDepositButtons())
        ],
      ),
    );
  }
}
