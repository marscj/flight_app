import 'package:equatable/equatable.dart';

abstract class TicketsState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  TicketsState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  TicketsState getStateCopy();

  TicketsState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnTicketsState extends TicketsState {

  UnTicketsState(int version) : super(version);

  @override
  String toString() => 'UnTicketsState';

  @override
  UnTicketsState getStateCopy() {
    return UnTicketsState(0);
  }

  @override
  UnTicketsState getNewVersion() {
    return UnTicketsState(version+1);
  }
}

/// Initialized
class InTicketsState extends TicketsState {
  final String hello;

  InTicketsState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InTicketsState $hello';

  @override
  InTicketsState getStateCopy() {
    return InTicketsState(version, hello);
  }

  @override
  InTicketsState getNewVersion() {
    return InTicketsState(version+1, hello);
  }
}

class ErrorTicketsState extends TicketsState {
  final String errorMessage;

  ErrorTicketsState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorTicketsState';

  @override
  ErrorTicketsState getStateCopy() {
    return ErrorTicketsState(version, errorMessage);
  }

  @override
  ErrorTicketsState getNewVersion() {
    return ErrorTicketsState(version+1, 
    errorMessage);
  }
}
