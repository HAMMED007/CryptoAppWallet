import 'package:cryptoapp/views/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatefulWidget {
  final int pageIndex;
  const AppBarWidget({super.key, this.pageIndex = 0});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool isDarkMode = false;

  String modeTitle = "Light";
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
      modeTitle = isDarkMode ? "Dark" : "Light";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset('assets/qr.png'),
          SizedBox(
            width: 10,
          ),
          if (widget.pageIndex != 2)
            const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back,",
                    style: TextStyle(fontSize: 17),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Singapore!",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_on_rounded),
          onPressed: () {
            // Get.to(AuthPage());
          },
        ),
      ],
    );
  }
}
