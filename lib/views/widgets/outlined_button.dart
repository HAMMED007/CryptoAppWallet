import 'package:cryptoapp/views/widgets/custom_dialogues.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  const OutlinedButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        child: Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
