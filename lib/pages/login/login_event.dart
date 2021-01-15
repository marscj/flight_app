import 'dart:async';

import 'package:saadiyat/pages/login/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
}

class LoadLoginEvent extends LoginEvent {
  final bool loading;

  LoadLoginEvent(this.loading);

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield LoginState(loading);
  }
}
