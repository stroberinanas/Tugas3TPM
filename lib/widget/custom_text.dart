import 'package:flutter/material.dart';

class CustomText {
  static Text h1(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text h2(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text sub(String text, {Color? color}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.grey.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
