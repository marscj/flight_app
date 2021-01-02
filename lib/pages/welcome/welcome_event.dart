import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/welcome/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WelcomeEvent {
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc});
}

class UnWelcomeEvent extends WelcomeEvent {
  @override
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc}) async* {
    yield UnWelcomeState(0);
  }
}

class LoadWelcomeEvent extends WelcomeEvent {
  final bool isError;
  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent(this.isError);

  @override
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc}) async* {
    yield InWelcomeState(0, 'SAADIYAT WAY');

    try {
      await Future.delayed(Duration(seconds: 2)).then((rews) {
        return RestClient().getInfo().then((res) {
          // appBloc.add(UpdateAppUser(res));
          // bloc.add(LoadBasementEvent());
        });
      });
    } catch (_) {
      // bloc.add(LoadLoginEvent(false));
      yield InWelcomeState(0, 'SAADIYAT WAY');
    }
  }
}
