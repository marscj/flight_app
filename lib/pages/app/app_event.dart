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
    // 电源管理
    await Wakelock.enable();
    // 强制竖屏
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    yield currentState.copyWith(event: CheckVersionEvent());
  }
}

class CheckVersionEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    try {
      yield await RestClient().checkVersion({}).then((res) {
        if (res.result) {
          return currentState.copyWith(event: UserInfoEvent());
        }
        return currentState;
      });
    } on DioError catch (_, stackTrace) {
      developer.log('$_',
          name: 'CheckVersionEvent', error: _, stackTrace: stackTrace);

      yield currentState.copyWith(
          event: ErrorEvent('Network connection failed!'));
    }
  }
}

class UserInfoEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState.copyWith(event: JMessageInitEvent());

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

class JMessageInitEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState;
  }
}

class ErrorEvent extends AppEvent {
  final String errorMessage;

  ErrorEvent(this.errorMessage);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    // TODO: implement applyAsync
    yield currentState;
  }
}
