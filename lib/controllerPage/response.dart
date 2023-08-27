import 'dart:developer';

import 'package:flutter/material.dart';

import '../Repositories/services/service.dart';
import '../models/profileModel.dart';
import '../widgets/sms_validator.dart';
import 'controllerPage.dart';

getDataFunc(context, userTokenn) async {
  try {
    final response =
        await Network.GETUSERDATA('/api/profile/view_own_profile', userTokenn);

    if (response.statusCode == 200) {
      final userData = profileModelFromJson(response.body.toString());
      log(response.body.toString());

      log('get data success');

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ControllerPage(userData: userData),
      ));
    }
    if (response.statusCode == 400) {
      Navigator.pop(context);
      smsValidator(context, 'Account is not found');
    }
  } finally {}
}
