import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  HomeState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  HomeState getStateCopy();

  HomeState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class WelComeState extends HomeState {
  WelComeState(int version) : super(version);

  @override
  String toString() => 'WelComeState';

  @override
  WelComeState getStateCopy() {
    return WelComeState(0);
  }

  @override
  WelComeState getNewVersion() {
    return WelComeState(version + 1);
  }
}

class LoginState extends HomeState {
  LoginState(int version) : super(version);

  @override
  String toString() => 'LoginState';

  @override
  LoginState getStateCopy() {
    return LoginState(version);
  }

  @override
  LoginState getNewVersion() {
    return LoginState(version + 1);
  }
}

/// Initialized
class InHomeState extends HomeState {
  final String hello;

  InHomeState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InHomeState $hello';

  @override
  InHomeState getStateCopy() {
    return InHomeState(version, hello);
  }

  @override
  InHomeState getNewVersion() {
    return InHomeState(version + 1, hello);
  }
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorHomeState';

  @override
  ErrorHomeState getStateCopy() {
    return ErrorHomeState(version, errorMessage);
  }

  @override
  ErrorHomeState getNewVersion() {
    return ErrorHomeState(version + 1, errorMessage);
  }
}
