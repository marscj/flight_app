import 'dart:async';

import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';

import 'bookings_bloc.dart';
import 'bookings_state.dart';

@immutable
abstract class BookingsEvent {
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc});
}

class RefreshBookingsEvent extends BookingsEvent {
  final BookingListExtra result;

  RefreshBookingsEvent(this.result);

  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
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
