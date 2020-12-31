import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/bookings/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingsEvent {
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc});
}

class UnBookingsEvent extends BookingsEvent {
  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
    yield UnBookingsState(0);
  }
}

class LoadBookingsEvent extends BookingsEvent {
  @override
  String toString() => 'LoadBookingsEvent';

  LoadBookingsEvent();

  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
    try {
      yield InBookingsState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBookingsEvent', error: _, stackTrace: stackTrace);
      yield ErrorBookingsState(0, _?.toString());
    }
  }
}
