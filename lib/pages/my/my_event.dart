import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'my_bloc.dart';
import 'my_state.dart';

@immutable
abstract class MyEvent {
  Stream<MyState> applyAsync({MyState currentState, MyBloc bloc});
}

class UnMyEvent extends MyEvent {
  @override
  Stream<MyState> applyAsync({MyState currentState, MyBloc bloc}) async* {
    yield UnMyState(0);
  }
}

class LoadMyEvent extends MyEvent {
  @override
  String toString() => 'LoadMyEvent';

  LoadMyEvent();

  @override
  Stream<MyState> applyAsync({MyState currentState, MyBloc bloc}) async* {
    try {
      yield InMyState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMyEvent', error: _, stackTrace: stackTrace);
      yield ErrorMyState(0, _?.toString());
    }
  }
}
