import 'dart:developer';

import 'package:tutorchat/const.dart';
import 'package:http/http.dart' as http;

Future<void> fetchData(url) async {
  String token =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwidXNlcm5hbWUiOiJ1c2VyIiwiaWF0IjoxNjkyODg3MzMxLCJleHAiOjE2OTU0NzkzMzF9.uBtHLRA1eeNYLxUxlk7vNAt_MfVxqDl0CfmiQ4MM8OQoYKUZFyBAkHpbVvow5JHd-xFeUzHQkIJN3fGjE9kruw'; // Replace with your actual token

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'image/jpeg', 'Authorization': 'Bearer $token'},
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
