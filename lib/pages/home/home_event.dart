import 'dart:async';

import 'package:meta/meta.dart';

import 'home_bloc.dart';
import 'home_state.dart';

@immutable
abstract class HomeEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class UnHomeEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    yield UnHomeState(0);
  }
}

class LoadHomeEvent extends HomeEvent {
  @override
  String toString() => 'LoadHomeEvent';

  LoadHomeEvent();

  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    try {
      yield InHomeState(0, 'Hello world');
    } catch (_) {}
  }
}
