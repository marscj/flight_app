import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

abstract class AppState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;

  AppState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  AppState getStateCopy();

  AppState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnAppState extends AppState {
  UnAppState(int version) : super(version);

  @override
  String toString() => 'UnAppState';

  @override
  UnAppState getStateCopy() {
    return UnAppState(0);
  }

  @override
  UnAppState getNewVersion() {
    return UnAppState(version + 1);
  }
}

/// Initialized
class InAppState extends AppState {
  final User user;

  InAppState(int version, this.user) : super(version, [user]);

  @override
  String toString() => 'InAppState';

  @override
  InAppState getStateCopy() {
    return InAppState(version, user);
  }

  @override
  InAppState getNewVersion() {
    return InAppState(version + 1, user);
  }
}

class ErrorAppState extends AppState {
  final String errorMessage;

  ErrorAppState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorAppState';

  @override
  ErrorAppState getStateCopy() {
    return ErrorAppState(version, errorMessage);
  }

  @override
  ErrorAppState getNewVersion() {
    return ErrorAppState(version + 1, errorMessage);
  }
}
