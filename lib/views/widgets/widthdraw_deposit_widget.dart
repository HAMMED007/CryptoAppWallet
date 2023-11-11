import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/views/widgets/bottom_sheet_tile_widget.dart';
import 'package:cryptoapp/views/widgets/filled_button.dart';
import 'package:cryptoapp/views/widgets/text_field_widget.dart';
import 'package:cryptoapp/views/widgets/tile_bottomsheet_widget.dart';
import 'package:flutter/material.dart';

class WithDrawDepositButtons extends StatefulWidget {
  const WithDrawDepositButtons({super.key});

  @override
  State<WithDrawDepositButtons> createState() => _WithDrawDepositButtonsState();
}

class _WithDrawDepositButtonsState extends State<WithDrawDepositButtons> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20),
                                child: Text(
                                  "Withdraw BTC",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20),
                                child: Text(
                                  "To",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextFieldWidget(
                                titleText: "Search",
                                hintText: "Search, public address (0x), or ENS",
                                trailingIcon: AssetConstants.qr,
                                trailingFuntion: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return AmountBottomSheetWidget(
                                            title: "", subTitle: "subTitle");
                                      });
                                    },
                                  );
                                },
                                textController: searchEditingController,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20),
                                child: Text(
                                  "Recent",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const BottomSheetTileWidget(
                                title: "1Lbcfr7s****4ZnX71",
                                subTitle: "18 August 2023",
                              ),
                              const BottomSheetTileWidget(
                                title: "1Lbcfr7s****4ZnX71",
                                subTitle: "18 August 2023",
                              ),
                              const BottomSheetTileWidget(
                                title: "1Lbcfr7s****4ZnX71",
                                subTitle: "18 August 2023",
                              ),
                              const BottomSheetTileWidget(
                                title: "1Lbcfr7s****4ZnX71",
                                subTitle: "18 August 2023",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                },
            child: Container(
              height: 70,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                  child: Text(
                "Withdraw",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
            )),
        TextButton(
            onPressed: () => {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Deposit BTC",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.apply(
                                              color: Colors.black,
                                              fontSizeFactor: 1.4,
                                              fontWeightDelta: 2)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Image.asset(AssetConstants.qrcode),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: Text(
                                        "Send only the specified coins to this deposit address.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.apply(
                                                color: Colors.black,
                                                fontSizeFactor: 1,
                                                fontWeightDelta: 1)),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Deposit Address",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.apply(
                                                          color: Colors.black,
                                                          fontSizeFactor: 1.2,
                                                          fontWeightDelta: 1)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "TKcakjhebcbycewvyvbcwejewvnewl",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.apply(
                                                          color: Colors.black,
                                                          fontSizeFactor: 1,
                                                          fontWeightDelta: 1)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.copy)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  FilledButtonWidget(
                                      text: "Deposit BTC", onPressed: () => {})
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                },
            child: Container(
              height: 70,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                  child: Text(
                "Deposit",
                style: TextStyle(
                    fontSize: 17,
                    color: ColorConstants.filledButonTextColor,
                    fontWeight: FontWeight.bold),
              )),
            )),
      ],
    );
  }
}
