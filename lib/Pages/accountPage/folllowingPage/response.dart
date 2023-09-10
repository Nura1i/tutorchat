import 'dart:developer';

import 'package:http/http.dart';
import 'package:tutorchat/Repositories/services/service.dart';
import 'package:tutorchat/const.dart';

getUserFollowingListFunc() async {
  final Response response = await Network.GETUSERDATA(
      '/api/follow/current_user_following_list', userToken);
  if (response.statusCode == 200) {
    log(response.body);
  } else {
    log('error with ${response.statusCode}');
  }
}
