import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;
  WelcomeState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  WelcomeState getStateCopy();

  WelcomeState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// Initialized
class InWelcomeState extends WelcomeState {
  final PageRouteInfo routeInfo;

  InWelcomeState(int version, this.routeInfo) : super(version, [routeInfo]);

  @override
  InWelcomeState getStateCopy() {
    return InWelcomeState(version, routeInfo);
  }

  @override
  InWelcomeState getNewVersion() {
    return InWelcomeState(version + 1, routeInfo);
  }
}

class ErrorWelcomeState extends WelcomeState {
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
