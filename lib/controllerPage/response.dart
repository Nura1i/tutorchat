import 'dart:developer';

import 'package:flutter/material.dart';

import '../Repositories/services/service.dart';
import '../const.dart';
import '../models/profileModel.dart';
import '../widgets/sms_validator.dart';
import 'package:http/http.dart' as http;
import 'controllerPage.dart';

getDataFunc(context, userTokenn) async {
  try {
    final response =
        await Network.GETUSERDATA('/api/profile/view_own_profile', userTokenn);

    if (response.statusCode == 200) {
      final userData = profileModelFromJson(response.body.toString());
      log(response.body.toString());

      log('get data success');
      try {
        http.Response responsee = await http.get(
          Uri.parse(userData.image),
          headers: {
            'Content-Type': 'image/jpeg',
            'Authorization': 'Bearer $userTokenn'
          },
        );

        if (responsee.statusCode == 200) {
          // Successful request
          log('success');
          constUserPhoto = responsee.bodyBytes;
          Navigator.pop(context);
          profileDataConst = userData;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ControllerPage(userData: userData),
          ));
        } else {
          // Error handling
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (error) {
        // Exception handling
        print('Error: $error');
      }
    }
    if (response.statusCode == 400) {
      Navigator.pop(context);
      smsValidator(context, 'Account is not found');
    }
  } finally {}
}
