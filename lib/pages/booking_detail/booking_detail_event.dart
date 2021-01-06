import 'dart:async';

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking_detail/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingDetailEvent {
  Stream<BookingDetailState> applyAsync(
      {BookingDetailState currentState, BookingDetailBloc bloc});
}

class RefreshBookingDetailEvent extends BookingDetailEvent {
  final BookingExtra result;

  RefreshBookingDetailEvent(this.result);

  @override
  Stream<BookingDetailState> applyAsync(
      {BookingDetailState currentState, BookingDetailBloc bloc}) async* {
    yield currentState.copyWith(data: result?.data);
  }
}
