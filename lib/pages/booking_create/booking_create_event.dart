import 'dart:async';

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
    yield currentState.copyWith(
        step: currentState.step + 1, action: 'step_continue');
  }
}

class StepCancelEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(
        step: currentState.step - 1, action: 'step_cancel');
  }
}

class StepTappedEvent extends BookingCreateEvent {
  final int step;

  StepTappedEvent(this.step);

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(step: step, action: 'step_tapped');
  }
}

class SubmitBookingEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    yield currentState.copyWith(action: 'booking_create');
  }
}

class UpdateBookingEvent extends BookingCreateEvent {
  final String action;
  final Booking booking;

  UpdateBookingEvent({this.action, this.booking});

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState.copyWith(
        action: action, booking: booking, step: currentState.step + 1);
  }
}
