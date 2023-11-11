import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:flutter/material.dart';

class AppHomeDataModel {
  String iconURL;
  Color iconBoxColor;
  String iconName;
  String iconMarketValue;
  String iconMarketNumber;

  AppHomeDataModel(
      {required this.iconURL,
      required this.iconMarketNumber,
      required this.iconMarketValue,
      required this.iconName,
      required this.iconBoxColor});
}

List<AppHomeDataModel> appHomeDataModel = [
  AppHomeDataModel(
      iconURL: AssetConstants.usdt,
      iconName: "USDT",
      iconMarketValue: "+0.67%",
      iconMarketNumber: 'N750',
      iconBoxColor: ColorConstants.green),
  AppHomeDataModel(
      iconURL: AssetConstants.btc,
      iconName: "BTC",
      iconMarketValue: "+0.50%",
      iconMarketNumber: 'N750',
      iconBoxColor: ColorConstants.orange),
];
