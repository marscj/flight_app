import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:meta/meta.dart';
import 'package:wakelock/wakelock.dart';

@immutable
abstract class AppEvent {
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc});
}

class AppInitEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState.copyWith(event: this);
    // 电源管理
    Wakelock.enable();

    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}

class CheckVersionEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState.copyWith(event: this);
    bloc.add(UserInfoEvent());
    yield currentState;
  }
}

class UserInfoEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState.copyWith(event: this);
    // try {
    //   yield await RestClient().getInfo().then((res) {
    //     return appBloc.add(Authorization(res));
    //   }).then((res) {
    //     return Future.delayed(Duration(seconds: 1)).then((res) {
    //       return InAppState(1, BasementRoute());
    //     });
    //   });
    // } catch (errors) {
    //   if (errors is DioError) {
    //     if (errors?.response?.statusCode == 401) {
    //       yield InAppState(1, BasementRoute());
    //     }
    //   } else {
    //     yield ErrorAppState(1, 'Connection timed out!');
    //   }
    // }
  }
}
