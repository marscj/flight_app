import 'dart:async';

import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';

import 'tickets_bloc.dart';
import 'tickets_state.dart';

@immutable
abstract class TicketsEvent {
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc});
}

class RefreshTicketsEvent extends TicketsEvent {
  final TicketListExtra result;

  RefreshTicketsEvent(this.result);

  @override
  Stream<TicketsState> applyAsync(
      {TicketsState currentState, TicketsBloc bloc}) async* {
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
