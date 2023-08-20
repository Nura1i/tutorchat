import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:tutorchat/const.dart';
import 'package:tutorchat/models/registerWphoneModel.dart';

import '../../models/photoModel.dart';

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

  static Future<http.Response> GETUSERDATA(String api, String userToken) async {
    Map<String, String> headersUser = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var uri = Uri.https(BASE, api); // http or https
    var response = await get(uri, headers: headersUser);

    if (response.statusCode == 200) {
      log(response.body);
      return response;
    } else {
      return response;
    }
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

  static Future<http.Response> registerWithPhonePost(
      RegisterWphoneModel model) async {
    final url =
        Uri.parse('https://api.tutorchat.uz/api/auth/register_with_phone');

    final headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $userToken',
    };

    final request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields['imageId'] = model.imageId;
    request.fields['username'] = model.username;
    request.fields['email'] = model.email;
    request.fields['password'] = model.password;
    request.fields['confirmPassword'] = model.confirmPassword;
    request.fields['fullName'] = model.fullName;
    request.fields['birth_date'] = '2023-08-06';
    request.fields['address'] = model.address;
    request.fields['description'] = model.description;
    request.fields['telegramLink'] = model.telegramLink;
    request.fields['instagramLink'] = model.instagramLink;
    request.fields['facebookLink'] = model.facebookLink;
    request.fields['specialtyType'] = model.specialtyType;
    request.fields['genderType'] = model.genderType;
    log(request.fields.toString());

    final response = await http.Response.fromStream(await request.send());

    return response;
  }

  static Future<http.Response> loginToSystem(
      String username, String password) async {
    var url =
        Uri.parse('https://api.tutorchat.uz/api/login/public/login_to_system');

    var headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    var body = {
      'username': username,
      'password': password,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Login successful!');
      print(response.body);
      // Handle the successful login response here
    } else {
      print('Login failed with status: ${response.statusCode}');
    }
    return response;
  }

  static Future uploadFile(File file) async {
    var uri = Uri.parse('https://api.tutorchat.uz/api/attach/upload');
    var request = http.MultipartRequest('POST', uri);

    // Add headers to the request
    request.headers.addAll({
      'Authorization': 'Bearer $userToken',
      'Content-Type': 'multipart/form-data',
    });

    var fileStream = http.ByteStream(file.openRead());
    var fileLength = await file.length();

    var multipartFile = http.MultipartFile(
      'file',
      fileStream,
      fileLength,
      filename: file.path.split('/').last,
    );

    request.files.add(multipartFile);

    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    PhotoModel? idPhoto;
    if (response.statusCode == 200) {
      var responseData = jsonDecode(responseString);
      idPhoto = PhotoModel.fromJson(responseData);
      // log('File uploaded: $responseData');
      log('idPhoto: ${idPhoto.id}');
      PhotoId = idPhoto.id;
    } else {
      log('Error uploading file: $response');
    }
    return idPhoto!.id;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }
}
