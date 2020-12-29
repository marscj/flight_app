import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/ticket/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TicketEvent {
  Stream<TicketState> applyAsync({TicketState currentState, TicketBloc bloc});
}

class UnTicketEvent extends TicketEvent {
  @override
  Stream<TicketState> applyAsync(
      {TicketState currentState, TicketBloc bloc}) async* {
    yield UnTicketState(0);
  }
}

class LoadTicketEvent extends TicketEvent {
  final bool isError;
  @override
  String toString() => 'LoadTicketEvent';

  LoadTicketEvent(this.isError);

  @override
  Stream<TicketState> applyAsync(
      {TicketState currentState, TicketBloc bloc}) async* {
    try {
      yield InTicketState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadTicketEvent', error: _, stackTrace: stackTrace);
      yield ErrorTicketState(0, _?.toString());
    }
  }
}
