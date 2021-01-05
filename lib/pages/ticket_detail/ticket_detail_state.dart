import 'package:equatable/equatable.dart';

abstract class TicketDetailState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  TicketDetailState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  TicketDetailState getStateCopy();

  TicketDetailState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnTicketDetailState extends TicketDetailState {

  UnTicketDetailState(int version) : super(version);

  @override
  String toString() => 'UnTicketDetailState';

  @override
  UnTicketDetailState getStateCopy() {
    return UnTicketDetailState(0);
  }

  @override
  UnTicketDetailState getNewVersion() {
    return UnTicketDetailState(version+1);
  }
}

/// Initialized
class InTicketDetailState extends TicketDetailState {
  final String hello;

  InTicketDetailState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InTicketDetailState $hello';

  @override
  InTicketDetailState getStateCopy() {
    return InTicketDetailState(version, hello);
  }

  @override
  InTicketDetailState getNewVersion() {
    return InTicketDetailState(version+1, hello);
  }
}

class ErrorTicketDetailState extends TicketDetailState {
  final String errorMessage;

  ErrorTicketDetailState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorTicketDetailState';

  @override
  ErrorTicketDetailState getStateCopy() {
    return ErrorTicketDetailState(version, errorMessage);
  }

  @override
  ErrorTicketDetailState getNewVersion() {
    return ErrorTicketDetailState(version+1, 
    errorMessage);
  }
}
