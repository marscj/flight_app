import 'package:equatable/equatable.dart';

abstract class ItineraryState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  ItineraryState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  ItineraryState getStateCopy();

  ItineraryState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnItineraryState extends ItineraryState {

  UnItineraryState(int version) : super(version);

  @override
  String toString() => 'UnItineraryState';

  @override
  UnItineraryState getStateCopy() {
    return UnItineraryState(0);
  }

  @override
  UnItineraryState getNewVersion() {
    return UnItineraryState(version+1);
  }
}

/// Initialized
class InItineraryState extends ItineraryState {
  final String hello;

  InItineraryState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InItineraryState $hello';

  @override
  InItineraryState getStateCopy() {
    return InItineraryState(version, hello);
  }

  @override
  InItineraryState getNewVersion() {
    return InItineraryState(version+1, hello);
  }
}

class ErrorItineraryState extends ItineraryState {
  final String errorMessage;

  ErrorItineraryState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorItineraryState';

  @override
  ErrorItineraryState getStateCopy() {
    return ErrorItineraryState(version, errorMessage);
  }

  @override
  ErrorItineraryState getNewVersion() {
    return ErrorItineraryState(version+1, 
    errorMessage);
  }
}
