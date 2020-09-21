import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory/data/models/data.dart';
import 'package:inventory/data/repository/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository repository;

  UserBloc({this.repository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchUser) {
      yield* _mapFetchUserToEvent();
    } else if (event is SaveUser) {

    }
  }

  Stream<UserState> _mapFetchUserToEvent() async* {
    try {
      var data = await repository.getUser();
      if (data != null) {
        yield UserExisted(data);
      } else {
        yield UserNotExisted();
      }
    } catch (e) {
      yield UserNotExisted();
    }
  }

  Stream<UserState> _mapSaveUserToEvent() async* {
    try {
      var data = await repository.getUser();
      if (data != null) {
        yield UserExisted(data);
      } else {
        yield UserNotExisted();
      }
    } catch (e) {
      yield UserNotExisted();
    }
  }
}
