import 'dart:async';

import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';

import 'index.dart';

@immutable
abstract class BookingEvent {
  Stream<BookingState> applyAsync(
      {BookingState currentState, BookingBloc bloc});
}

class RefreshBookingEvent extends BookingEvent {
  final Booking result;

  RefreshBookingEvent(this.result);

  @override
  Stream<BookingState> applyAsync(
      {BookingState currentState, BookingBloc bloc}) async* {
    yield currentState.copyWith(data: result);
  }
}
