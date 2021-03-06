import 'dart:async';
import 'dart:io';

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
    yield currentState.copyWith(
        step: currentState.step + 1, action: 'step_continue');
  }
}

class StepCancelEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
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
    yield currentState.copyWith(step: step, action: 'step_tapped');
  }
}

class SubmitBookingEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    yield currentState.copyWith(action: 'booking_submit');
  }
}

class UpdateBookingEvent extends BookingCreateEvent {
  final String action;
  final Booking booking;

  UpdateBookingEvent({this.action, this.booking});

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    yield currentState.copyWith(
        action: action, booking: booking, step: currentState.step + 1);
  }
}

class RefreshItineraryEvent extends BookingCreateEvent {
  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    yield await RestClient().getItinerarys(
        query: {'booking_id': currentState.booking.id}).then((res) {
      return currentState.copyWith(
          itineraries: res.data, action: 'refreshed_itinerary');
    }).catchError((error) {
      return currentState.copyWith(action: 'refreshed_itinerary');
    });
  }
}

class UploadEvent extends BookingCreateEvent {
  final File file;
  final Booking booking;

  UploadEvent(this.file, this.booking);

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    yield currentState.copyWith(action: 'upload_start');

    yield await RestClient().upload(file, booking.id, 'booking').then((res) {
      return currentState.copyWith(action: 'upload_finish');
    }).catchError((res) {
      return currentState.copyWith(action: 'upload_failed');
    });
  }
}

class RefreshBtaEvent extends BookingCreateEvent {
  final Booking booking;

  RefreshBtaEvent(this.booking);

  @override
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc}) async* {
    yield await RestClient().getUploads(
        query: {'object_id': booking.id, 'type': 'booking'}).then((res) {
      return currentState.copyWith(action: 'refresh_bta', uploads: res.data);
    });
  }
}
