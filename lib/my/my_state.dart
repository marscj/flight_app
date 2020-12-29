import 'package:equatable/equatable.dart';

abstract class MyState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  MyState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  MyState getStateCopy();

  MyState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnMyState extends MyState {

  UnMyState(int version) : super(version);

  @override
  String toString() => 'UnMyState';

  @override
  UnMyState getStateCopy() {
    return UnMyState(0);
  }

  @override
  UnMyState getNewVersion() {
    return UnMyState(version+1);
  }
}

/// Initialized
class InMyState extends MyState {
  final String hello;

  InMyState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InMyState $hello';

  @override
  InMyState getStateCopy() {
    return InMyState(version, hello);
  }

  @override
  InMyState getNewVersion() {
    return InMyState(version+1, hello);
  }
}

class ErrorMyState extends MyState {
  final String errorMessage;

  ErrorMyState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorMyState';

  @override
  ErrorMyState getStateCopy() {
    return ErrorMyState(version, errorMessage);
  }

  @override
  ErrorMyState getNewVersion() {
    return ErrorMyState(version+1, 
    errorMessage);
  }
}
