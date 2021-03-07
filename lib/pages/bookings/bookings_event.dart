import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';

import 'bookings_bloc.dart';
import 'bookings_state.dart';

@immutable
abstract class BookingsEvent {
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc});
}

class RefreshBookingsEvent extends BookingsEvent {
  final BookingListExtra result;
  final BuildContext context;

  RefreshBookingsEvent(this.result, this.context);

  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
    // ignore: close_sinks
    AppBloc bloc = BlocProvider.of<AppBloc>(context);
    bloc.add(UpdateMessagesEvent(result.extra ?? []));

    yield currentState.copyWith(
        pageNo: 2,
        totalCount: result?.data?.totalCount ?? 0,
        list: result?.data?.data ?? []);
  }
}

class LoadBookingsEvent extends BookingsEvent {
  final BookingListExtra result;

  LoadBookingsEvent(this.result);

  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
    yield currentState.copyWith(
        list: currentState.list + (result?.data?.data ?? []),
        pageNo: currentState.pageNo + 1);
  }
}
