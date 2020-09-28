import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter/services/model/userProvider.dart';
import 'package:counter/services/model/usermodel.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserBlocFetched) {
      List<UserModel> users = await UserProvider.fetchusers();
      yield UserData(users: users);
    }
  }
}
