import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/const.dart';
import 'package:tutorchat/models/tokenModel.dart';
import 'package:tutorchat/widgets/sms_validator.dart';

import '../../Repositories/services/service.dart';
import '../../controllerPage/response.dart';

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
      final userData = tokenModelFromJson(response.body.toString());
      log(response.body.toString());
      userToken = userData.token;
      log('success sended sms');
      await getDataFunc(context, userToken);
    }
    if (response.statusCode == 400) {
      Navigator.pop(context);
      smsValidator(context, 'Account is not found');
    }
  } finally {}
}
