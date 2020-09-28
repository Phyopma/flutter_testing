part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class DetailRequested extends DetailEvent {
  final String login;
  DetailRequested({this.login});
}
