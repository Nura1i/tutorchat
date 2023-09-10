import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/const.dart';
import 'package:tutorchat/othersProfilePage/otherUserDataScreen.dart';

import '../models/profileModel.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchDataUser(
    BuildContext context, String id) async {
  final url = 'https://api.tutorchat.uz/api/profile/view_other_profile/$id';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $userToken'
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final otherUserData = profileModelFromJson(response.body.toString());
    log(otherUserData.username);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OtherUserDataScreen(profileData: otherUserData),
    ));

    try {
      http.Response responsee = await http.get(
        Uri.parse(otherUserData.image),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer $userToken'
        },
      );

      if (responsee.statusCode == 200) {
        log('success get photo');
        constOtherUserPhoto = responsee.bodyBytes;

        // Navigator.pop(context);
        // profileDataConst = userData;
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => OthersProfileScreen(profileData: userData),
        // ));
      } else {
        // Error handling
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Exception handling
      print('Error: $error');
    }
    return data;
  } else {
    log(response.statusCode.toString());
    throw Exception('Failed to fetch data');
  }
}

Future<void> followProfile(String username) async {
  final url =
      Uri.parse('https://api.tutorchat.uz/api/follow/follow_profile/$username');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    },
    body: json.encode({
      'username': username,
    }),
  );

  if (response.statusCode == 200) {
    log(response.body.toString());
  } else {
    log('Follow profile failed');
    log('Error status code: ${response.statusCode}');
    log('Error body: ${response.body}');
  }
}
