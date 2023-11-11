import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/views/pages/wallet_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateTileWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String rate;
  const RateTileWidget(
      {super.key, required this.icon, required this.title, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: GestureDetector(
            onTap: () =>
                {Get.to(WalletDetailPage(title: title, assetPath: icon))},
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
                      Row(
                        children: [
                          Image.asset(
                            icon,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        rate,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 17,
                          color: ColorConstants.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
          )),
    );
  }
}
