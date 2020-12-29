import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  SettingsState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  SettingsState getStateCopy();

  SettingsState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnSettingsState extends SettingsState {

  UnSettingsState(int version) : super(version);

  @override
  String toString() => 'UnSettingsState';

  @override
  UnSettingsState getStateCopy() {
    return UnSettingsState(0);
  }

  @override
  UnSettingsState getNewVersion() {
    return UnSettingsState(version+1);
  }
}

/// Initialized
class InSettingsState extends SettingsState {
  final String hello;

  InSettingsState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InSettingsState $hello';

  @override
  InSettingsState getStateCopy() {
    return InSettingsState(version, hello);
  }

  @override
  InSettingsState getNewVersion() {
    return InSettingsState(version+1, hello);
  }
}

class ErrorSettingsState extends SettingsState {
  final String errorMessage;

  ErrorSettingsState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorSettingsState';

  @override
  ErrorSettingsState getStateCopy() {
    return ErrorSettingsState(version, errorMessage);
  }

  @override
  ErrorSettingsState getNewVersion() {
    return ErrorSettingsState(version+1, 
    errorMessage);
  }
}
