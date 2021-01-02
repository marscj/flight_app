import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  WelcomeState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  WelcomeState getStateCopy();

  WelcomeState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnWelcomeState extends WelcomeState {

  UnWelcomeState(int version) : super(version);

  @override
  String toString() => 'UnWelcomeState';

  @override
  UnWelcomeState getStateCopy() {
    return UnWelcomeState(0);
  }

  @override
  UnWelcomeState getNewVersion() {
    return UnWelcomeState(version+1);
  }
}

/// Initialized
class InWelcomeState extends WelcomeState {
  final String hello;

  InWelcomeState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InWelcomeState $hello';

  @override
  InWelcomeState getStateCopy() {
    return InWelcomeState(version, hello);
  }

  @override
  InWelcomeState getNewVersion() {
    return InWelcomeState(version+1, hello);
  }
}

class ErrorWelcomeState extends WelcomeState {
  final String errorMessage;

  ErrorWelcomeState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorWelcomeState';

  @override
  ErrorWelcomeState getStateCopy() {
    return ErrorWelcomeState(version, errorMessage);
  }

  @override
  ErrorWelcomeState getNewVersion() {
    return ErrorWelcomeState(version+1, 
    errorMessage);
  }
}
