import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter/services/model/userProvider.dart';
import 'package:counter/services/userdetail.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial());

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    if (event is DetailRequested) {
      UserDetail user = await UserProvider.fetchdetail(event.login);
      yield DetailData(user: user);
    }
  }
}
