import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/repairPage/repairPhoneScreen.dart';

import '../../Repositories/services/service.dart';
import '../../widgets/sms_validator.dart';

phoneVerifRepairFunc(String phoneNumber, context) async {
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
        builder: (context) => repairPhoneScreen(phoneNumber: phoneNumber),
      ));
    }
    if (response.statusCode == 400) {
      Navigator.pop(context);
      smsValidator(context, 'Phone is not valid or Account is blocked');
    } else {
      throw Exception('Ошибка запроса: ${response.statusCode}');
    }
  } finally {}
}
