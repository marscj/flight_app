import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';
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
    Wakelock.enable();

    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}

class Authorization extends AppEvent {
  final User user;

  @override
  String toString() => 'LoadAppEvent';

  Authorization(this.user);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield InAppState(1, user);
  }
}
