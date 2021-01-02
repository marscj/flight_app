import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/pages/basement/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasementEvent {
  Stream<BasementState> applyAsync(
      {BasementState currentState, BasementBloc bloc});
}

class LoadBasementEvent extends BasementEvent {
  @override
  String toString() => 'LoadBasementEvent';

  LoadBasementEvent();

  @override
  Stream<BasementState> applyAsync(
      {BasementState currentState, BasementBloc bloc}) async* {
    try {
      yield InBasementState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBasementEvent', error: _, stackTrace: stackTrace);
      yield ErrorBasementState(0, _?.toString());
    }
  }
}
