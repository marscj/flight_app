import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';
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
  final BuildContext context;

  RefreshTicketDetailEvent(this.result, this.context);

  @override
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc}) async* {
    // ignore: close_sinks
    AppBloc bloc = BlocProvider.of<AppBloc>(context);
    bloc.add(UpdateMessagesEvent(result.extra ?? []));
    yield currentState.copyWith(data: result?.data);
  }
}

class UpdateTicketEvent extends TicketDetailEvent {
  final Ticket data;

  UpdateTicketEvent(this.data);

  @override
  Stream<TicketDetailState> applyAsync(
      {TicketDetailState currentState, TicketDetailBloc bloc}) async* {
    EasyLoading.show();

    yield await RestClient()
        .confirmTicket(data.id, {'confirm': true}).then((res) {
      EasyLoading.showSuccess('Success');
      return currentState.copyWith(data: res.data);
    }).catchError((error) {
      EasyLoading.showError('Failed');
      return currentState;
    });
  }
}
