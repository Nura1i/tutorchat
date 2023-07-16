import 'package:flutter/material.dart';

smsValidator(BuildContext context, text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1000),
      elevation: 100,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      backgroundColor: Colors.red,
      content: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Lora",
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
