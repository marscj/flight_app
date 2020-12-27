import 'package:equatable/equatable.dart';
import 'package:saadiyat/index/index.dart';

/// UnInitialized
class UnLoginState extends IndexState {
  UnLoginState(int version) : super(version);

  @override
  String toString() => 'UnLoginState';

  @override
  UnLoginState getStateCopy() {
    return UnLoginState(0);
  }

  @override
  UnLoginState getNewVersion() {
    return UnLoginState(version + 1);
  }
}

/// Initialized
class InLoginState extends IndexState {
  final String hello;

  InLoginState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InLoginState $hello';

  @override
  InLoginState getStateCopy() {
    return InLoginState(version, hello);
  }

  @override
  InLoginState getNewVersion() {
    return InLoginState(version + 1, hello);
  }
}

class ErrorLoginState extends IndexState {
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
