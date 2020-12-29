import 'package:equatable/equatable.dart';

abstract class TicketState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  TicketState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  TicketState getStateCopy();

  TicketState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnTicketState extends TicketState {

  UnTicketState(int version) : super(version);

  @override
  String toString() => 'UnTicketState';

  @override
  UnTicketState getStateCopy() {
    return UnTicketState(0);
  }

  @override
  UnTicketState getNewVersion() {
    return UnTicketState(version+1);
  }
}

/// Initialized
class InTicketState extends TicketState {
  final String hello;

  InTicketState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InTicketState $hello';

  @override
  InTicketState getStateCopy() {
    return InTicketState(version, hello);
  }

  @override
  InTicketState getNewVersion() {
    return InTicketState(version+1, hello);
  }
}

class ErrorTicketState extends TicketState {
  final String errorMessage;

  ErrorTicketState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorTicketState';

  @override
  ErrorTicketState getStateCopy() {
    return ErrorTicketState(version, errorMessage);
  }

  @override
  ErrorTicketState getNewVersion() {
    return ErrorTicketState(version+1, 
    errorMessage);
  }
}
