import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/tickets/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TicketsEvent {
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc});
}

class UnTicketsEvent extends TicketsEvent {
  @override
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc}) async* {
    yield UnTicketsState(0);
  }
}

class LoadTicketsEvent extends TicketsEvent {
  final bool isError;
  @override
  String toString() => 'LoadTicketsEvent';

  LoadTicketsEvent(this.isError);

  @override
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc}) async* {
    try {
      yield UnTicketsState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadTicketsEvent', error: _, stackTrace: stackTrace);
      yield ErrorTicketsState(0, _?.toString());
    }
  }
}
