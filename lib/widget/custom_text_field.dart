import 'package:flutter/material.dart';

class CustomTextField {
  static TextField form(
    TextEditingController controller, {
    String? label,
    bool isObscure = false,
    bool isError = false,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: isError ? Colors.red.shade100 : Colors.transparent,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: isError ? Colors.red.shade800 : Colors.grey.shade600,
              )
            : null,
        suffixIcon: suffixIcon,
        suffixIconColor: isError ? Colors.red.shade800 : Colors.grey.shade600,
        labelText: label,
        labelStyle: TextStyle(
          color: isError ? Colors.red.shade800 : Colors.grey.shade600,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: isError ? Colors.red.shade800 : Colors.grey.shade600,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: isError ? Colors.red.shade800 : Colors.grey.shade600,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: isError ? Colors.red.shade800 : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
