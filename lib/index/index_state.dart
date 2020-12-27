import 'package:equatable/equatable.dart';

abstract class IndexState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  IndexState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  IndexState getStateCopy();

  IndexState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

class ErrorIndexState extends IndexState {
  final String errorMessage;

  ErrorIndexState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorIndexState';

  @override
  ErrorIndexState getStateCopy() {
    return ErrorIndexState(version, errorMessage);
  }

  @override
  ErrorIndexState getNewVersion() {
    return ErrorIndexState(version + 1, errorMessage);
  }
}
