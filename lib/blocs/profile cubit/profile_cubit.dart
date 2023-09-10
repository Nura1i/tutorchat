import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:tutorchat/blocs/profile%20cubit/profile_state.dart';

import '../../Repositories/services/service.dart';
import '../../const.dart';
import '../../models/userFollowingListModel.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInit());

  bool load = false;
  List<UserFollowingListModel> userFollowingList = [];
  getUserFollowingListFunc() async {
    load = true;
    emit(ProfileLoading(load));
    final Response response = await Network.GETUSERDATA(
        '/api/follow/current_user_following_list', userToken);
    if (response.statusCode == 200) {
      log(response.body);
      userFollowingList = userFollowingListModelFromJson(response.body);
      emit(ProfileFollowingList(userFollowingList));
    } else {
      log('error with ${response.statusCode}');
    }
    load = !load;
    emit(ProfileLoading(load));
  }
}
