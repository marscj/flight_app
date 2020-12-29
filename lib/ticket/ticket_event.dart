import 'dart:async';

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
