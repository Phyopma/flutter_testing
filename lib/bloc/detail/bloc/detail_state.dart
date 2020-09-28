part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

// ignore: must_be_immutable
class DetailData extends DetailState {
  UserDetail user;
  DetailData({this.user});
}
