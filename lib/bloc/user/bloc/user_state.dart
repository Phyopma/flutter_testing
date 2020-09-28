part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserData extends UserState {
  final List<UserModel> users;
  UserData({this.users});
}
