import 'package:cryptoapp/controllers/currency_controller.dart';
import 'package:cryptoapp/views/pages/home_page.dart';
import 'package:cryptoapp/views/pages/profile_page.dart';
import 'package:cryptoapp/views/pages/withdraw_page.dart';
import 'package:cryptoapp/views/styles.dart';
import 'package:cryptoapp/views/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final CurrencyController currencyController =
      Get.find(tag: 'currencyController');
  static final List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    const WithDrawPage(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currencyController.selectedNavigationIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(40.0), // Adjust the height as needed
          child: AppBarWidget(
            pageIndex: currencyController.selectedNavigationIndex.value,
          )),
      body: Obx(() {
        return _widgetOptions
            .elementAt(currencyController.selectedNavigationIndex.value);
      }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffAEADB2),
              width: 0.3,
            ),
          ),
        ),
          child: Obx(() {
            return BottomNavigationBar(
              elevation: 0,
              backgroundColor: Styles.primaryColor,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).dividerColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              enableFeedback: false,
              unselectedLabelStyle: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 14),
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/home.png'),
                    size: 25,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const ImageIcon(
                        AssetImage('assets/home.png'),
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/wallet.png'),
                    size: 25,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      child: const ImageIcon(
                        AssetImage('assets/wallet.png'),
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/person.png'),
                    size: 25,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      child: const ImageIcon(
                        AssetImage('assets/person.png'),
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  label: "Outfits",
                ),
              ],
              currentIndex: currencyController.selectedNavigationIndex.value,
              iconSize: 25,
              onTap: _onItemTapped,
            );
          })
      ),
    );
  }
}
