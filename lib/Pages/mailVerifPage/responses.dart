import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Repositories/services/service.dart';
import 'mailPinCodeScreen.dart';

mailVerifFunc(String email, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );

  try {
    final response = await Network.sendEmail(email);
    if (response.statusCode == 200) {
      log('success sended sms');
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => mailPinScreen(email: email),
      ));
    } else {
      throw Exception('Ошибка запроса: ${response.statusCode}');
    }
  } finally {}
}

mailPinVerifFunc(String email, String pin) async {
  final response = await Network.checkEmailPin(email, pin);
  if (response.statusCode == 200) {
    log('success checked sms');
    log(response.body.toString());
  } else {
    log(response.body.toString());
    log('does not checked');
  }
  return response;
}
