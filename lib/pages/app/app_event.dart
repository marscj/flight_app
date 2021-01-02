import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:wakelock/wakelock.dart';

import 'app_bloc.dart';
import 'app_state.dart';

@immutable
abstract class AppEvent {
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc});
}

class UnAppEvent extends AppEvent {
  final BuildContext context;

  UnAppEvent(this.context);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield UnAppState(0);
    // 电源管理
    await Wakelock.enable();

    // 强制竖屏
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await precacheImage(Image.asset('assets/logo.png').image, context);
  }
}

class LoadAppEvent extends AppEvent {
  final bool isError;

  @override
  String toString() => 'LoadAppEvent';

  LoadAppEvent(this.isError);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    try {} catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAppEvent', error: _, stackTrace: stackTrace);
      yield ErrorAppState(0, _?.toString());
    }
  }
}
