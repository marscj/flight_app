import 'package:equatable/equatable.dart';

abstract class BtaState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  BtaState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  BtaState getStateCopy();

  BtaState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnBtaState extends BtaState {

  UnBtaState(int version) : super(version);

  @override
  String toString() => 'UnBtaState';

  @override
  UnBtaState getStateCopy() {
    return UnBtaState(0);
  }

  @override
  UnBtaState getNewVersion() {
    return UnBtaState(version+1);
  }
}

/// Initialized
class InBtaState extends BtaState {
  final String hello;

  InBtaState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InBtaState $hello';

  @override
  InBtaState getStateCopy() {
    return InBtaState(version, hello);
  }

  @override
  InBtaState getNewVersion() {
    return InBtaState(version+1, hello);
  }
}

class ErrorBtaState extends BtaState {
  final String errorMessage;

  ErrorBtaState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorBtaState';

  @override
  ErrorBtaState getStateCopy() {
    return ErrorBtaState(version, errorMessage);
  }

  @override
  ErrorBtaState getNewVersion() {
    return ErrorBtaState(version+1, 
    errorMessage);
  }
}
