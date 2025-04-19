import 'package:flutter/material.dart';

class CustomButton {
  static Widget primary(String label, Function function, double width) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () => function(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static IconButton logout(Function function) {
    return IconButton(
      onPressed: () => function(),
      icon: Icon(Icons.logout_outlined),
      color: Colors.white,
    );
  }
}
