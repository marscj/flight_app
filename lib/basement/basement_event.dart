import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/basement/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasementEvent {
  Stream<BasementState> applyAsync(
      {BasementState currentState, BasementBloc bloc});
}

class UnBasementEvent extends BasementEvent {
  @override
  Stream<BasementState> applyAsync(
      {BasementState currentState, BasementBloc bloc}) async* {
    yield UnBasementState(0);
  }
}

class LoadBasementEvent extends BasementEvent {
  final bool isError;
  @override
  String toString() => 'LoadBasementEvent';

  LoadBasementEvent(this.isError);

  @override
  Stream<BasementState> applyAsync(
      {BasementState currentState, BasementBloc bloc}) async* {
    try {
      yield UnBasementState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBasementEvent', error: _, stackTrace: stackTrace);
      yield ErrorBasementState(0, _?.toString());
    }
  }
}
