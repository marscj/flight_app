import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  LoginState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  LoginState getStateCopy();

  LoginState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// Initialized
class InLoginState extends LoginState {
  final bool loading;

  InLoginState(int version, this.loading) : super(version, [loading]);

  @override
  String toString() => 'InLoginState $loading';

  @override
  InLoginState getStateCopy() {
    return InLoginState(version, loading);
  }

  @override
  InLoginState getNewVersion() {
    return InLoginState(version + 1, loading);
  }
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorLoginState';

  @override
  ErrorLoginState getStateCopy() {
    return ErrorLoginState(version, errorMessage);
  }

  @override
  ErrorLoginState getNewVersion() {
    return ErrorLoginState(version + 1, errorMessage);
  }
}
