import 'dart:async';
import 'dart:developer' as developer;

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
    try {
      yield InLoginState(0, false);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(0, _?.toString());
    }
  }
}
