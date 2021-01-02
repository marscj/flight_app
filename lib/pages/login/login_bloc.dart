import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/login/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  static final LoginBloc _loginBlocSingleton = LoginBloc._internal();
  factory LoginBloc() {
    return _loginBlocSingleton;
  }
  LoginBloc._internal() : super(InLoginState(0, false));

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
