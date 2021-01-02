import 'package:equatable/equatable.dart';

abstract class BasementState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  BasementState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  BasementState getStateCopy();

  BasementState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnBasementState extends BasementState {

  UnBasementState(int version) : super(version);

  @override
  String toString() => 'UnBasementState';

  @override
  UnBasementState getStateCopy() {
    return UnBasementState(0);
  }

  @override
  UnBasementState getNewVersion() {
    return UnBasementState(version+1);
  }
}

/// Initialized
class InBasementState extends BasementState {
  final String hello;

  InBasementState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InBasementState $hello';

  @override
  InBasementState getStateCopy() {
    return InBasementState(version, hello);
  }

  @override
  InBasementState getNewVersion() {
    return InBasementState(version+1, hello);
  }
}

class ErrorBasementState extends BasementState {
  final String errorMessage;

  ErrorBasementState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorBasementState';

  @override
  ErrorBasementState getStateCopy() {
    return ErrorBasementState(version, errorMessage);
  }

  @override
  ErrorBasementState getNewVersion() {
    return ErrorBasementState(version+1, 
    errorMessage);
  }
}
