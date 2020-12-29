import 'package:equatable/equatable.dart';

abstract class BookingState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  BookingState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  BookingState getStateCopy();

  BookingState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnBookingState extends BookingState {

  UnBookingState(int version) : super(version);

  @override
  String toString() => 'UnBookingState';

  @override
  UnBookingState getStateCopy() {
    return UnBookingState(0);
  }

  @override
  UnBookingState getNewVersion() {
    return UnBookingState(version+1);
  }
}

/// Initialized
class InBookingState extends BookingState {
  final String hello;

  InBookingState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InBookingState $hello';

  @override
  InBookingState getStateCopy() {
    return InBookingState(version, hello);
  }

  @override
  InBookingState getNewVersion() {
    return InBookingState(version+1, hello);
  }
}

class ErrorBookingState extends BookingState {
  final String errorMessage;

  ErrorBookingState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorBookingState';

  @override
  ErrorBookingState getStateCopy() {
    return ErrorBookingState(version, errorMessage);
  }

  @override
  ErrorBookingState getNewVersion() {
    return ErrorBookingState(version+1, 
    errorMessage);
  }
}
