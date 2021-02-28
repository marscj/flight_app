import 'dart:async';
import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';

import 'home_bloc.dart';
import 'home_state.dart';

@immutable
abstract class HomeEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class LoadMessagesEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield await RestClient().getMessages(query: {'read': false}).then((res) {
      return currentState.copyWith(messages: res);
    }).catchError((error) {
      return currentState;
    });
  }
}
