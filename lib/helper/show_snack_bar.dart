import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, int color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      backgroundColor: Color(color),
    ),
  );
}
