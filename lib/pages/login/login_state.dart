import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  /// notify change state without deep clone state
  final bool loading;

  LoginState(this.loading);

  factory LoginState.initial() => LoginState(false);

  @override
  List<Object> get props => ([loading]);
}
