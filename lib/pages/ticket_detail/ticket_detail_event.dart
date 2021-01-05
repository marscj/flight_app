import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/pages/ticket_detail/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TicketDetailEvent {
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc});
  final TicketDetailRepository _ticketDetailRepository = TicketDetailRepository();
}

class UnTicketDetailEvent extends TicketDetailEvent {
  @override
  Stream<TicketDetailState> applyAsync({TicketDetailState currentState, TicketDetailBloc bloc}) async* {
    yield UnTicketDetailState(0);
  }
}

class LoadTicketDetailEvent extends TicketDetailEvent {
   
  final bool isError;
  @override
  String toString() => 'LoadTicketDetailEvent';

  LoadTicketDetailEvent(this.isError);

  @override
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc}) async* {
    try {
      yield UnTicketDetailState(0);
      await Future.delayed(Duration(seconds: 1));
      _ticketDetailRepository.test(isError);
      yield InTicketDetailState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadTicketDetailEvent', error: _, stackTrace: stackTrace);
      yield ErrorTicketDetailState(0, _?.toString());
    }
  }
}
