import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking_create/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingCreateEvent {
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc});
}

class StepContinueEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(step: currentState.step + 1);
  }
}

class StepCancelEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(step: currentState.step - 1);
  }
}

class StepTappedEvent extends BookingCreateEvent {
  final int step;

  StepTappedEvent(this.step);

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(step: step);
  }
}

class UpdateBookingEvent extends BookingCreateEvent {
  final Booking booking;

  UpdateBookingEvent(this.booking);

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(booking: booking, step: currentState.step + 1);
  }
}
