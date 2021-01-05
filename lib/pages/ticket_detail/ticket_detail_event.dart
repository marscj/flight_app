import 'dart:async';

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TicketDetailEvent {
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc});
}

class RefreshTicketDetailEvent extends TicketDetailEvent {
  final TicketExtra result;

  RefreshTicketDetailEvent(this.result);

  @override
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc}) async* {
    yield currentState.copyWith(data: result.data);
  }
}
