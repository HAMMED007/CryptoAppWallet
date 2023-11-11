import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/controllers/shared_pref_controller.dart';
import 'package:cryptoapp/views/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  redirect() async {
    debugPrint("redirecting......");
    final SharedPrefsController sharedPrefsController =
        Get.find(tag: 'sharedPrefsController');
    await sharedPrefsController.init();
    await AuthService().autoLogin();
  }

  @override
  void initState() {
    super.initState();

    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          AssetConstants.appIcon,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
