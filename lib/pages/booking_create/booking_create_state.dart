import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class BookingCreateState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final int step;

  final Booking booking;

  BookingCreateState({this.version, this.step, this.booking});

  factory BookingCreateState.initial() =>
      BookingCreateState(version: 0, step: 0, booking: null);

  BookingCreateState copyWith({int version, int step, Booking booking}) =>
      BookingCreateState(
          version: this.version + 1,
          step: step ?? this.step,
          booking: booking ?? this.booking);

  @override
  List<Object> get props => ([version, step]);
}
