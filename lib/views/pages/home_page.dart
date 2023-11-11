import 'dart:async';
import 'package:cryptoapp/Model/crypto_values.dart';
import 'package:cryptoapp/Services/http_service.dart';
import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/views/pages/home_old.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CurrencyController currencyController =
      Get.find(tag: 'currencyController');

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 60), (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future:
          currencyController.loadPrices(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RefreshIndicator(
            onRefresh: () async {
              await currencyController.loadPrices();
            },
            child: HomePageWidget(
              usdtPrice: currencyController.usdt.value,
              portfolioPrice: currencyController.walletPrice.value,
              btcPrice: currencyController.btc.value,
              ethPrice: currencyController.eth.value,
            ));
      },
    );
  }
}
