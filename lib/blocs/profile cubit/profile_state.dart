import '../../models/userFollowingListModel.dart';

abstract class ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileInit extends ProfileState {}

class ProfileFollowingList extends ProfileState {
  final List<UserFollowingListModel> followingList;
  ProfileFollowingList(this.followingList);
}

class ProfileLoading extends ProfileState {
  final loading;
  ProfileLoading(this.loading);
}

class ProfileError extends ProfileState {
  final error;
  ProfileError(this.error);
}
