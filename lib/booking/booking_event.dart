import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/booking/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingEvent {
  Stream<BookingState> applyAsync(
      {BookingState currentState, BookingBloc bloc});
}

class UnBookingEvent extends BookingEvent {
  @override
  Stream<BookingState> applyAsync(
      {BookingState currentState, BookingBloc bloc}) async* {
    yield UnBookingState(0);
  }
}

class LoadBookingEvent extends BookingEvent {
  final bool isError;
  @override
  String toString() => 'LoadBookingEvent';

  LoadBookingEvent(this.isError);

  @override
  Stream<BookingState> applyAsync(
      {BookingState currentState, BookingBloc bloc}) async* {
    try {
      yield UnBookingState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBookingEvent', error: _, stackTrace: stackTrace);
      yield ErrorBookingState(0, _?.toString());
    }
  }
}
