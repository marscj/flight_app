import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/my/index.dart';
import 'package:meta/meta.dart';

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
  final bool isError;
  @override
  String toString() => 'LoadMyEvent';

  LoadMyEvent(this.isError);

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
