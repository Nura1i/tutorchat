import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/PhoneVerificationPage/pinCodeScreen.dart';

import '../../Repositories/services/service.dart';

phoneVerifFunc(String phoneNumber, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );

  try {
    final response = await Network.sendPhone(phoneNumber);
    log(phoneNumber);
    if (response.statusCode == 200) {
      log('success sended sms');
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => pinCodeScreen(phoneNumber: phoneNumber),
      ));
    } else {
      throw Exception('Ошибка запроса: ${response.statusCode}');
    }
  } finally {}
}

phonePinVerifFunc(String phoneNumber, String pin) async {
  final response = await Network.checkPhonePin(phoneNumber, pin);
  if (response.statusCode == 200) {
    log('success checked sms phone');
    log(response.body.toString());
  } else {
    log(response.body.toString());
    log('does not checked');
  }
  return response;
}
