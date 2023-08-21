import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/controllerPage/controllerPage.dart';
import 'package:tutorchat/widgets/sms_validator.dart';

import '../../Repositories/services/service.dart';

loginFunc(String username, String password, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );

  try {
    final response = await Network.loginToSystem(username, password);

    if (response.statusCode == 200) {
      log('success sended sms');
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>  ControllerPage(),
      ));
    }
    if (response.statusCode == 400) {
      Navigator.pop(context);
      smsValidator(context, 'Account is not found');
    }
  } finally {}
}
