import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/views/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpad_layout/widgets/numpad.dart';

class BottomSheetTileWidget extends StatefulWidget {
  final String title;
  final String subTitle;

  const BottomSheetTileWidget(
      {super.key, required this.title, required this.subTitle});

  @override
  State<BottomSheetTileWidget> createState() => _BottomSheetTileWidgetState();
}

class _BottomSheetTileWidgetState extends State<BottomSheetTileWidget> {
  String number = "";
  bool isDotAdded = false;
  String selectedValue = 'BTC';
  onKeyboardTap(String value) {
    setState(() {
      number = number + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CurrencyController currencyController =
        Get.find(tag: 'currencyController');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () => {Get.back()},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.arrow_back_ios),
                                      Text("Amount",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.apply(
                                                  color: Colors.black,
                                                  fontSizeFactor: 1.4,
                                                  fontWeightDelta: 1)),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Material(
                                    elevation: 10,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        // Red background color
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton<String>(
                                          value: selectedValue,
                                          icon: const Icon(Icons
                                              .arrow_drop_down_outlined), // Down arrow icon
                                          iconSize: 30,
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          underline: Container(
                                            height: 0,
                                            color: Colors.white,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue!;
                                            });
                                          },
                                          items: <String>['BTC', 'ETH', 'USDT']
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        number = "5.994";
                                      });
                                    },
                                    child: Text("Use max",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.apply(
                                                color: Colors.black,
                                                fontSizeFactor: 1.3,
                                                fontWeightDelta: 1)),
                                  ),
                                ],
                              ),
                              Text(number,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.apply(
                                          color: Colors.black,
                                          fontSizeFactor: 3,
                                          fontWeightDelta: 3)),
                              Text("Balance: 0.995 $selectedValue",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.apply(
                                          color: Colors.black,
                                          fontSizeFactor: 1.4,
                                          fontWeightDelta: 1)),
                              Container(
                                height: 90,
                                decoration: BoxDecoration(
                                  color: ColorConstants.lightGreen,
                                  borderRadius: BorderRadius.circular(20.0),
                                  // Rounded corners
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "N ${currencyController.getRate(selectedValue, convertToDoubleOrDefault(number, defaultVal: 0.0))}",
                                          overflow: TextOverflow.visible,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.apply(
                                                  color: Colors.black,
                                                  fontSizeFactor: 2.3,
                                                  fontWeightDelta: 2)),
                                      Row(
                                        children: [
                                          Image.asset(AssetConstants.arowUp),
                                          Image.asset(AssetConstants.arowDown),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              NumPad(
                                arabicDigits: false,
                                onType: (value) {
                                  setState(() {
                                    number += value;
                                  });
                                },
                                rightWidget: IconButton(
                                  icon: const Icon(Icons.backspace),
                                  onPressed: () {
                                    if (number.isNotEmpty) {
                                      setState(() {
                                        number = number.substring(
                                            0, number.length - 1);
                                      });
                                    }
                                  },
                                ),
                                leftWidget: IconButton(
                                  icon: const Icon(
                                    Icons.circle,
                                    size: 10,
                                  ),
                                  onPressed: () {
                                    if (!isDotAdded) {
                                      setState(() {
                                        number += ".";
                                        isDotAdded = true;
                                      });
                                    }
                                  },
                                ),
                              ),
                              FilledButtonWidget(
                                  text: "Proceed",
                                  onPressed: () => {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter setState) {
                                                return SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.9,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      18.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => {
                                                                  Get.back()
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    const Icon(Icons
                                                                        .arrow_back_ios),
                                                                    Text(
                                                                        "Confirm",
                                                                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSizeFactor:
                                                                                1.4,
                                                                            fontWeightDelta:
                                                                                1)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          28.0),
                                                              child: Text(
                                                                "To",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            Material(
                                                                elevation: 10,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                child:
                                                                    GestureDetector(
                                                                        onTap: () =>
                                                                            {},
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child: Container(
                                                                              height: 40,
                                                                              width: 400,
                                                                              decoration: BoxDecoration(
                                                                                // Red background color
                                                                                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                                                              ),
                                                                              child: const Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      "1Lbcfr7s****4ZnX71",
                                                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    Text(
                                                                                      "X",
                                                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              )),
                                                                        ))),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Material(
                                                                elevation: 10,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                child:
                                                                    GestureDetector(
                                                                        onTap: () =>
                                                                            {},
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child: Container(
                                                                              height: 100,
                                                                              width: 400,
                                                                              decoration: BoxDecoration(
                                                                                // Red background color
                                                                                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        const Text(
                                                                                          "Amount",
                                                                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Row(
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              AssetConstants.btc,
                                                                                              height: 20,
                                                                                            ),
                                                                                            const Text(
                                                                                              "0.5 BTC",
                                                                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 20,
                                                                                    ),
                                                                                    const Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Network fee",
                                                                                          style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Text(
                                                                                          "0.001 BTC",
                                                                                          style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              )),
                                                                        ))),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Material(
                                                                elevation: 10,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                child:
                                                                    GestureDetector(
                                                                        onTap: () =>
                                                                            {},
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child: Container(
                                                                              height: 100,
                                                                              width: 400,
                                                                              decoration: BoxDecoration(
                                                                                // Red background color
                                                                                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        const Text(
                                                                                          "Total Amount",
                                                                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Row(
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              AssetConstants.btc,
                                                                                              height: 20,
                                                                                            ),
                                                                                            const Text(
                                                                                              "0.5 BTC",
                                                                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 20,
                                                                                    ),
                                                                                    const Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          "",
                                                                                          style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                        Text(
                                                                                          "0.001 BTC",
                                                                                          style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              )),
                                                                        ))),
                                                            Center(
                                                              child:
                                                                  FilledButtonWidget(
                                                                      onPressed:
                                                                          () =>
                                                                              {
                                                                                showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                                                                        return SizedBox(
                                                                                            height: MediaQuery.of(context).size.height * 0.9,
                                                                                            child: Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(18.0),
                                                                                                      child: GestureDetector(
                                                                                                        onTap: () => {Get.back()},
                                                                                                        child: Row(
                                                                                                          children: [
                                                                                                            const Icon(Icons.arrow_back_ios),
                                                                                                            Text("BTC WIthdrawal", style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.black, fontSizeFactor: 1.4, fontWeightDelta: 1)),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                        padding: EdgeInsets.all(28.0),
                                                                                                        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                                          Image.asset(AssetConstants.sucess),
                                                                                                          const SizedBox(
                                                                                                            height: 10,
                                                                                                          ),
                                                                                                          const Text(
                                                                                                            "Success!",
                                                                                                            style: TextStyle(fontSize: 30, color: ColorConstants.black, fontWeight: FontWeight.bold),
                                                                                                          ),
                                                                                                          Center(
                                                                                                            child: Text(
                                                                                                              "Transaction completed",
                                                                                                              style: TextStyle(
                                                                                                                fontSize: 20,
                                                                                                                color: ColorConstants.black,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ])),
                                                                                                    Material(
                                                                                                        elevation: 10,
                                                                                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                                        child: GestureDetector(
                                                                                                            onTap: () => {},
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                                              child: Container(
                                                                                                                  height: 40,
                                                                                                                  width: 400,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    // Red background color
                                                                                                                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                                                                                                  ),
                                                                                                                  child: const Padding(
                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          "1Lbcfr7s****4ZnX71",
                                                                                                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          "X",
                                                                                                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ))),
                                                                                                    SizedBox(
                                                                                                      height: 20,
                                                                                                    ),
                                                                                                    Material(
                                                                                                        elevation: 10,
                                                                                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                                        child: GestureDetector(
                                                                                                            onTap: () => {},
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                                              child: Container(
                                                                                                                  height: 100,
                                                                                                                  width: 400,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    // Red background color
                                                                                                                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                                                    child: Column(
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            const Text(
                                                                                                                              "Amount",
                                                                                                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                Image.asset(
                                                                                                                                  AssetConstants.btc,
                                                                                                                                  height: 20,
                                                                                                                                ),
                                                                                                                                const Text(
                                                                                                                                  "0.5 BTC",
                                                                                                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        const Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              "Network fee",
                                                                                                                              style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              "0.001 BTC",
                                                                                                                              style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ))),
                                                                                                    SizedBox(
                                                                                                      height: 20,
                                                                                                    ),
                                                                                                    Material(
                                                                                                        elevation: 10,
                                                                                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                                                                        child: GestureDetector(
                                                                                                            onTap: () => {},
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                                              child: Container(
                                                                                                                  height: 100,
                                                                                                                  width: 400,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    // Red background color
                                                                                                                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                                                    child: Column(
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            const Text(
                                                                                                                              "Total Amount",
                                                                                                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                Image.asset(
                                                                                                                                  AssetConstants.btc,
                                                                                                                                  height: 20,
                                                                                                                                ),
                                                                                                                                const Text(
                                                                                                                                  "0.5 BTC",
                                                                                                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        const Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              "",
                                                                                                                              style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              "0.001 BTC",
                                                                                                                              style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  )),
                                                                                                            ))),
                                                                                                  ],
                                                                                                )));
                                                                                      });
                                                                                    })
                                                                              },
                                                                      text:
                                                                          "Send"),
                                                            )
                                                          ],
                                                        )));
                                              });
                                            })
                                      })
                            ],
                          ),
                        ),
                      );
                
                    });
                  }),
            
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  // Red background color
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.subTitle,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                )),
          )),
    );
  }
}
