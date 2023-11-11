import 'dart:async';
import 'package:cryptoapp/Model/crypto_values.dart';
import 'package:cryptoapp/Services/http_service.dart';
import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/views/pages/home_old.dart';
import 'package:cryptoapp/views/widgets/portfolio_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioRefreshed extends StatefulWidget {
  const PortfolioRefreshed({super.key});

  @override
  State<PortfolioRefreshed> createState() => _PortfolioRefreshedState();
}

class _PortfolioRefreshedState extends State<PortfolioRefreshed> {
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
        return PortfolioImages(
            showWallet: false, value: currencyController.walletPrice.value);
      },
    );
  }
}
