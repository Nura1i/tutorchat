import 'dart:developer';

import 'package:flutter/material.dart';

import '../Repositories/services/service.dart';
import '../models/profileModel.dart';
import '../widgets/sms_validator.dart';

getDataFunc(String username, String password, context, userTokenn) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );

  try {
    final response =
        await Network.GETUSERDATA('/api/profile/view_own_profile', userTokenn);

    if (response.statusCode == 200) {
      final userData = profileModelFromJson(response.body.toString());
      log(response.body.toString());

      log('get data success');
      Navigator.pop(context);
    }
    if (response.statusCode == 400) {
      Navigator.pop(context);
      smsValidator(context, 'Account is not found');
    }
  } finally {}
}
