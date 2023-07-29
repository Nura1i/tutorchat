import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:tutorchat/const.dart';

class Network {
  static String BASE = "api.tutorchat.uz";
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Future<String?> GET(
    String api,
    Map<String, String> params,
    String userToken,
  ) async {
    Map<String, String> headersUser = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    };
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headersUser);

    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);

      return responseBody;
      // return null;
    }
    return null;
  }

  static Future<String?> GETUSERDATA(String api, String userToken) async {
    Map<String, String> headersUser = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var uri = Uri.https(BASE, api); // http or https
    var response = await get(uri, headers: headersUser);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<http.Response> sendEmail(String email) async {
    final url =
        Uri.parse('https://api.tutorchat.uz/api/email/public/sendEmail');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': email,
    });
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> sendPhone(String phone) async {
    final url = Uri.parse('https://api.tutorchat.uz/api/sms/public/sendSms');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'phone': phone,
    });
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> checkPhonePin(
      String phone, String phoneCode) async {
    final url = Uri.parse(
        'https://api.tutorchat.uz/api/sms/public/verification_sms_code?phone=%2B$phone&smsCode=$phoneCode');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'phone': phone,
      'smsCode': phoneCode,
    });
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> checkEmailPin(
      String email, String emailCode) async {
    final url = Uri.parse(
        'https://api.tutorchat.uz/api/email/public/verification_email?email=$email&emailCode=$emailCode');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': email,
      'emailCode': emailCode,
    });
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> registrWithEmailPost(
      String email, String emailCode) async {
    final url =
        Uri.parse('https://api.tutorchat.uz/api/auth/register_with_phone');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    final body = json.encode({
      'email': email,
      'emailCode': emailCode,
    });
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }
}
