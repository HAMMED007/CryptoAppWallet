import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';

import 'package:flutter/material.dart';

class AppParallelMarketModel {
  String iconURL;
  Color iconBoxColor;
  String iconName;
  String iconMarketValue;
  String iconMarketNumber;

  AppParallelMarketModel(
      {required this.iconURL,
      required this.iconMarketNumber,
      required this.iconMarketValue,
      required this.iconName,
      required this.iconBoxColor});
}

List<AppParallelMarketModel> appParallelMarketModel = [
  AppParallelMarketModel(
      iconURL: AssetConstants.usd,
      iconName: "USD",
      iconMarketValue: "+0.45%",
      iconMarketNumber: 'N750.1',
      iconBoxColor: ColorConstants.red),
  AppParallelMarketModel(
      iconURL: AssetConstants.gbp,
      iconName: "GBP",
      iconMarketValue: "+0.45%",
      iconMarketNumber: 'N912',
      iconBoxColor: ColorConstants.orange),
  AppParallelMarketModel(
      iconURL: AssetConstants.eur,
      iconName: "EUR",
      iconMarketValue: "+0.45%",
      iconMarketNumber: 'N740',
      iconBoxColor: ColorConstants.black),
  AppParallelMarketModel(
      iconURL: AssetConstants.cad,
      iconName: "CAD",
      iconMarketValue: "+0.45%",
      iconMarketNumber: 'N740',
      iconBoxColor: Colors.yellow),
  AppParallelMarketModel(
      iconURL: AssetConstants.cny,
      iconName: "CNY",
      iconMarketValue: "+0.45%",
      iconMarketNumber: 'N740',
      iconBoxColor: ColorConstants.blue),
];
