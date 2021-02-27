import 'dart:async';
import 'package:meta/meta.dart';

import 'home_bloc.dart';
import 'home_state.dart';

@immutable
abstract class HomeEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class LoadMessagesEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async* {
    // TODO: implement applyAsync
  }
}
