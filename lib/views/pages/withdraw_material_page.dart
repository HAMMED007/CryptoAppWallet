import 'package:cryptoapp/views/pages/withdraw_page.dart';
import 'package:cryptoapp/views/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class WithDrawMaterialPage extends StatefulWidget {
  const WithDrawMaterialPage({super.key});

  @override
  State<WithDrawMaterialPage> createState() => _WithDrawMaterialPageState();
}

class _WithDrawMaterialPageState extends State<WithDrawMaterialPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0), // Adjust the height as needed
          child: AppBarWidget(
            pageIndex: 1,
          )),
      body: WithDrawPage(),
    );
  }
}
