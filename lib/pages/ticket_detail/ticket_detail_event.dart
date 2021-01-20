import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';
import 'package:meta/meta.dart';

// ignore_for_file: non_constant_identifier_names

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

class UpdateTicketEvent extends TicketDetailEvent {
  final Ticket ticket;
  final bool is_confirm;

  UpdateTicketEvent(this.ticket, this.is_confirm);

  @override
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc}) async* {
    EasyLoading.show();
    yield await RestClient()
        .updateTicket(ticket.id, {'is_confirm': is_confirm}).then((res) {
      EasyLoading.showSuccess('Success');
      return currentState.copyWith(data: res.data);
    }).catchError((onError) {
      EasyLoading.showError('Failed');
      return currentState;
    });
  }
}
