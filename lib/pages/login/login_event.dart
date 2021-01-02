import 'dart:async';

import 'package:saadiyat/pages/login/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
}

class LoadLoginEvent extends LoginEvent {
  final bool loading;
  @override
  String toString() => 'LoadLoginEvent';

  LoadLoginEvent(this.loading);

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield InLoginState(0, loading);
  }
}
