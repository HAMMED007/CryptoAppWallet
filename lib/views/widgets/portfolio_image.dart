import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:flutter/material.dart';

class PortfolioImages extends StatefulWidget {
  final bool showWallet;
  final String value;

  const PortfolioImages(
      {super.key, this.showWallet = true, required this.value});

  @override
  State<PortfolioImages> createState() => _PortfolioImagesState();
}

class _PortfolioImagesState extends State<PortfolioImages> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Image.asset(
            AssetConstants.portBack,
            // Replace with your image URL
            width: double.maxFinite,
            height: 200,
            fit: BoxFit.cover,
          ),
          // Top Right Border Image
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              AssetConstants.portRight,
              // Replace with your border image asset
              width: 70,
              height: 70,
            ),
          ),
          // Bottom Left Border Image
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              AssetConstants.portleft,
              width: 70,
              height: 70,
            ),
          ),
          // Centered Text
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'N${widget.value}',
                style: TextStyle(
                  color: ColorConstants.appPrimaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.showWallet)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'View Wallet',
                      style: TextStyle(
                        color: ColorConstants.appPrimaryColor,
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      AssetConstants.forwardArrow,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
