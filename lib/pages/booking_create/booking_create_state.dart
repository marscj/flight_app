import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class BookingCreateState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final int step;

  final String action;

  final Booking booking;

  final List<Itinerary> itineraries;

  final List<Upload> uploads;

  BookingCreateState(
      {this.version,
      this.step,
      this.action,
      this.booking,
      this.itineraries,
      this.uploads});

  factory BookingCreateState.initial() => BookingCreateState(
      version: 0,
      step: 0,
      action: null,
      booking: null,
      itineraries: [],
      uploads: []);

  BookingCreateState copyWith(
          {int version,
          int step,
          String action,
          Booking booking,
          List<Itinerary> itineraries,
          List<Upload> uploads}) =>
      BookingCreateState(
          version: this.version + 1,
          step: step ?? this.step,
          action: action ?? this.action,
          booking: booking ?? this.booking,
          itineraries: itineraries ?? this.itineraries,
          uploads: uploads ?? this.uploads);

  @override
  List<Object> get props => ([version, step]);
}
