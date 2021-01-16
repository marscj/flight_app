import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/pages/booking_create/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingCreateEvent {
  Stream<BookingCreateState> applyAsync(
      {BookingCreateState currentState, BookingCreateBloc bloc});
}
