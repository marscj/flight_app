import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';

import 'tickets_bloc.dart';
import 'tickets_state.dart';

@immutable
abstract class TicketsEvent {
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc});
}

class RefreshTicketsEvent extends TicketsEvent {
  final TicketListExtra result;
  final BuildContext context;

  RefreshTicketsEvent(this.result, this.context);

  @override
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc}) async* {
    // ignore: close_sinks
    AppBloc bloc = BlocProvider.of<AppBloc>(context);
    bloc.add(UpdateMessagesEvent(result.extra ?? []));
    yield currentState.copyWith(
        pageNo: 2,
        totalCount: result?.data?.totalCount ?? 0,
        list: result?.data?.data ?? []);
  }
}

class LoadTicketsEvent extends TicketsEvent {
  final TicketListExtra result;

  LoadTicketsEvent(this.result);

  @override
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc}) async* {
    yield currentState.copyWith(
        list: currentState.list + (result?.data?.data ?? []),
        pageNo: currentState.pageNo + 1);
  }
}
