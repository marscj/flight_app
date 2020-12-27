import 'package:equatable/equatable.dart';
import 'package:saadiyat/index/index.dart';

/// UnInitialized
class UnWelcomeState extends IndexState {
  UnWelcomeState(int version) : super(version);

  @override
  String toString() => 'UnWelcomeState';

  @override
  UnWelcomeState getStateCopy() {
    return UnWelcomeState(0);
  }

  @override
  UnWelcomeState getNewVersion() {
    return UnWelcomeState(version + 1);
  }
}

/// Initialized
class InWelcomeState extends IndexState {
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
    return InWelcomeState(version + 1, hello);
  }
}

class ErrorWelcomeState extends IndexState {
  final String errorMessage;

  ErrorWelcomeState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorWelcomeState';

  @override
  ErrorWelcomeState getStateCopy() {
    return ErrorWelcomeState(version, errorMessage);
  }

  @override
  ErrorWelcomeState getNewVersion() {
    return ErrorWelcomeState(version + 1, errorMessage);
  }
}
