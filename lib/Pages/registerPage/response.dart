import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/HomePage/homeScreen.dart';
import 'package:tutorchat/controllerPage/controllerPage.dart';

import '../../Repositories/services/service.dart';
import '../../models/registerWphoneModel.dart';

registrFunc(String phoneNumber, context) async {
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
        builder: (context) => const HomeScreen(),
      ));
    } else {
      throw Exception('Ошибка запроса: ${response.statusCode}');
    }
  } finally {}
}

userRegistration(RegisterWphoneModel model, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );

  try {
    final response = await Network.registerWithPhonePost(model);

    if (response.statusCode == 200) {
      // log(response.body);
      log('success registered');
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ControllerPage(userToken: ""),
      ));
    } else {
      throw Exception('Ошибка запроса: ${response.statusCode}');
    }
  } finally {}
}
