import 'package:equatable/equatable.dart';

abstract class BasementState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  BasementState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  BasementState getStateCopy();

  BasementState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// Initialized
class InBasementState extends BasementState {
  InBasementState(int version)
      : super(
          version,
        );

  @override
  String toString() => 'InBasementState';

  @override
  InBasementState getStateCopy() {
    return InBasementState(version);
  }

  @override
  InBasementState getNewVersion() {
    return InBasementState(version + 1);
  }
}

class ErrorBasementState extends BasementState {
  final String errorMessage;

  ErrorBasementState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorBasementState';

  @override
  ErrorBasementState getStateCopy() {
    return ErrorBasementState(version, errorMessage);
  }

  @override
  ErrorBasementState getNewVersion() {
    return ErrorBasementState(version + 1, errorMessage);
  }
}
