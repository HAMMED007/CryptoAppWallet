import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/controllers/database_controller.dart';
import 'package:cryptoapp/controllers/shared_pref_controller.dart';
import 'package:cryptoapp/controllers/user_controller.dart';
import 'package:cryptoapp/firebase_options.dart';
import 'package:cryptoapp/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInit();
  Get.put(UserController(), tag: 'userController');
  Get.put(DatabaseController(), tag: 'databaseController');
  Get.put(SharedPrefsController(), tag: 'sharedPrefsController');
  Get.put(CurrencyController(), tag: 'currencyController');

  runApp(const MyApp());
}

Future<void> firebaseInit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, //auto choose from firebase_options file present in lib folder
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Crypto App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black, primary: Colors.black),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
