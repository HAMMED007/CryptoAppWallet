import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/views/widgets/bottom_sheet_tile_widget.dart';
import 'package:cryptoapp/views/widgets/filled_button.dart';
import 'package:cryptoapp/views/widgets/text_field_widget.dart';
import 'package:cryptoapp/views/widgets/wallet_tile_widget.dart';
import 'package:cryptoapp/views/widgets/widthdraw_deposit_widget.dart';
import 'package:flutter/material.dart';
import 'package:numpad_layout/widgets/numpad.dart';

class WalletDetailPage extends StatefulWidget {
  final String title;
  final String assetPath;

  WalletDetailPage({super.key, required this.assetPath, required this.title});

  @override
  State<WalletDetailPage> createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String number = "";
    bool isDotAdded = false;
    String selectedValue = 'BTC';
    onKeyboardTap(String value) {
      setState(() {
        number = number + value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_on_rounded),
            onPressed: () {
              // Get.to(AuthPage());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFieldWidget(
              titleText: "Search",
              textController: searchEditingController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView(
                children: [
                  WalletTileWidget(
                    title: widget.title,
                    titleShortForm: "BTC",
                    dateTime: "18 August 2023 at 10am",
                    type: "Withdrawal",
                    status: "Confirmed",
                    icon: widget.assetPath,
                    rate: 0.5,
                  ),
                  WalletTileWidget(
                    title: widget.title,
                    titleShortForm: "BTC",
                    dateTime: "18 August 2023 at 10am",
                    type: "Withdrawal",
                    status: "Failed",
                    icon: widget.assetPath,
                    rate: 0.5,
                  ),
                  WalletTileWidget(
                    title: widget.title,
                    titleShortForm: "BTC",
                    dateTime: "18 August 2023 at 10am",
                    type: "Withdrawal",
                    status: "Pending",
                    icon: widget.assetPath,
                    rate: 0.5,
                  ),
                ],
              ),
            ),
            const Center(child: WithDrawDepositButtons())

          ],
        ),
      ),
    );
  }
}
