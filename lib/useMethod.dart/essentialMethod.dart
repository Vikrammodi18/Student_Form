import 'package:flutter/material.dart';

void showSnackBar({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.deepPurple, content: Text(message)),
  );
}
