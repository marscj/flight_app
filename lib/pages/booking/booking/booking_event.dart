import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'index.dart';

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
  @override
  String toString() => 'LoadBookingEvent';

  LoadBookingEvent();

  @override
  Stream<BookingState> applyAsync(
      {BookingState currentState, BookingBloc bloc}) async* {
    try {
      yield InBookingState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBookingEvent', error: _, stackTrace: stackTrace);
      yield ErrorBookingState(0, _?.toString());
    }
  }
}
