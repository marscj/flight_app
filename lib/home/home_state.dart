import 'package:saadiyat/index/index.dart';

/// UnInitialized
class UnHomeState extends IndexState {
  UnHomeState(int version) : super(version);

  @override
  String toString() => 'UnHomeState';

  @override
  UnHomeState getStateCopy() {
    return UnHomeState(0);
  }

  @override
  UnHomeState getNewVersion() {
    return UnHomeState(version + 1);
  }
}

/// Initialized
class InHomeState extends IndexState {
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

class ErrorHomeState extends IndexState {
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
