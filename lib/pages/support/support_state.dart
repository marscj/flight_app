import 'package:equatable/equatable.dart';

abstract class SupportState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  SupportState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  SupportState getStateCopy();

  SupportState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnSupportState extends SupportState {

  UnSupportState(int version) : super(version);

  @override
  String toString() => 'UnSupportState';

  @override
  UnSupportState getStateCopy() {
    return UnSupportState(0);
  }

  @override
  UnSupportState getNewVersion() {
    return UnSupportState(version+1);
  }
}

/// Initialized
class InSupportState extends SupportState {
  final String hello;

  InSupportState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InSupportState $hello';

  @override
  InSupportState getStateCopy() {
    return InSupportState(version, hello);
  }

  @override
  InSupportState getNewVersion() {
    return InSupportState(version+1, hello);
  }
}

class ErrorSupportState extends SupportState {
  final String errorMessage;

  ErrorSupportState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorSupportState';

  @override
  ErrorSupportState getStateCopy() {
    return ErrorSupportState(version, errorMessage);
  }

  @override
  ErrorSupportState getNewVersion() {
    return ErrorSupportState(version+1, 
    errorMessage);
  }
}
