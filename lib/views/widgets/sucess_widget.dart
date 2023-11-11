import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SuccessWidget extends StatelessWidget {
  final String text;
  const SuccessWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Image.asset(AssetConstants.sucess),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Success!",
          style: TextStyle(
              fontSize: 30,
              color: ColorConstants.black,
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: ColorConstants.black,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: TextButton(
              onPressed: () => {Get.offAll(const LoginPage())},
              child: Container(
                height: 70,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                    child: Text(
                  "Log back in?",
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorConstants.filledButonTextColor,
                      fontWeight: FontWeight.bold),
                )),
              )),
        ),
      ],
    );
  }
}
