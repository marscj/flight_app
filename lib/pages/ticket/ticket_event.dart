import 'dart:async';
import 'package:meta/meta.dart';

import 'ticket_bloc.dart';
import 'ticket_state.dart';

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
  @override
  String toString() => 'LoadTicketEvent';

  LoadTicketEvent();

  @override
  Stream<TicketState> applyAsync(
      {TicketState currentState, TicketBloc bloc}) async* {
    try {
      yield InTicketState(0, 'Hello world');
    } catch (_) {}
  }
}
