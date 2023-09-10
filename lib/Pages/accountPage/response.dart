import 'dart:developer';

import 'package:tutorchat/const.dart';
import 'package:http/http.dart' as http;

Future<void> fetchData(url) async {
  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'image/jpeg',
        'Authorization': 'Bearer $userToken'
      },
    );

    if (response.statusCode == 200) {
      // Successful request
      log('success');
      constUserPhoto = response.bodyBytes;
      log(constUserPhoto.toString());
    } else {
      // Error handling
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    // Exception handling
    print('Error: $error');
  }
}
