import 'package:equatable/equatable.dart';

class BookingCreateState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final int step;

  BookingCreateState({this.version, this.step});

  factory BookingCreateState.initial() =>
      BookingCreateState(version: 0, step: 0);

  BookingCreateState copyWith({int version, int step}) =>
      BookingCreateState(version: this.version + 1, step: step ?? this.step);

  @override
  List<Object> get props => ([version, step]);
}
