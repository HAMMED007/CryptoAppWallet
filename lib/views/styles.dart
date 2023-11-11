import 'package:flutter/material.dart';

class Styles {
  static const Color primaryColor = Color(0xFF0C0622);
  static const Color whiteColor = Colors.white;
  static const darkColor = Color.fromARGB(255, 91, 88, 88);
  static BoxDecoration tileDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 0.1,
          ),
        ],
      );
}
