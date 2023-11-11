import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/views/pages/wallet_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletTileWidget extends StatelessWidget {
  final String icon;
  final String dateTime;
  final String title;
  final String titleShortForm;
  final String type;
  final String status;
  final double rate;
  const WalletTileWidget(
      {super.key,
      required this.icon,
      required this.dateTime,
      required this.rate,
      required this.status,
      required this.title,
      required this.type,
      required this.titleShortForm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: GestureDetector(
            onTap: () => {},
            child: Container(
                decoration: BoxDecoration(
                  // Red background color
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateTime,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            type,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            status,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12,
                                color: status == "Confirmed"
                                    ? ColorConstants.green
                                    : status == "Failed"
                                        ? ColorConstants.red
                                        : ColorConstants.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                icon,
                                height: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${rate.toStringAsFixed(2)} $titleShortForm",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Tap to expand for details",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 12,
                              color: ColorConstants.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          )),
    );
  }
}
