import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'bta_bloc.dart';
import 'bta_state.dart';

@immutable
abstract class BtaEvent {
  Stream<BtaState> applyAsync({BtaState currentState, BtaBloc bloc});
}

class UnBtaEvent extends BtaEvent {
  @override
  Stream<BtaState> applyAsync({BtaState currentState, BtaBloc bloc}) async* {
    yield UnBtaState(0);
  }
}

class LoadBtaEvent extends BtaEvent {
  final bool isError;
  @override
  String toString() => 'LoadBtaEvent';

  LoadBtaEvent(this.isError);

  @override
  Stream<BtaState> applyAsync({BtaState currentState, BtaBloc bloc}) async* {
    try {
      yield UnBtaState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBtaEvent', error: _, stackTrace: stackTrace);
      yield ErrorBtaState(0, _?.toString());
    }
  }
}
