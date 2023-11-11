import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/controllers/user_controller.dart';
import 'package:cryptoapp/views/pages/login_page.dart';
import 'package:cryptoapp/views/widgets/rate_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({super.key});

  @override
  State<SignOutPage> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  final UserController userController = Get.find(tag: "userController");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const Center(
            child: Text(
              "You have successfully logged out",
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
      ),
    );
  }
}
