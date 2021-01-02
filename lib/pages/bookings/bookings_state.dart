import 'package:equatable/equatable.dart';

abstract class BookingsState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  BookingsState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  BookingsState getStateCopy();

  BookingsState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnBookingsState extends BookingsState {

  UnBookingsState(int version) : super(version);

  @override
  String toString() => 'UnBookingsState';

  @override
  UnBookingsState getStateCopy() {
    return UnBookingsState(0);
  }

  @override
  UnBookingsState getNewVersion() {
    return UnBookingsState(version+1);
  }
}

/// Initialized
class InBookingsState extends BookingsState {
  final String hello;

  InBookingsState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InBookingsState $hello';

  @override
  InBookingsState getStateCopy() {
    return InBookingsState(version, hello);
  }

  @override
  InBookingsState getNewVersion() {
    return InBookingsState(version+1, hello);
  }
}

class ErrorBookingsState extends BookingsState {
  final String errorMessage;

  ErrorBookingsState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorBookingsState';

  @override
  ErrorBookingsState getStateCopy() {
    return ErrorBookingsState(version, errorMessage);
  }

  @override
  ErrorBookingsState getNewVersion() {
    return ErrorBookingsState(version+1, 
    errorMessage);
  }
}
