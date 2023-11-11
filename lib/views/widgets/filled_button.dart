import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  const FilledButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        child: Container(
          height: 70,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
