import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io' as IO;

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:meta/meta.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/store/store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

@immutable
abstract class AppEvent {
  PageRouteInfo get pageRouteInfo => null;

  String get errorMessage => null;

  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc});
}

class AppInitEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    // 键值对数据库
    await Hive.initFlutter();

    // 电源管理
    await Wakelock.enable();

    // 强制竖屏
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    Store.instance.getAuth();

    yield currentState.copyWith(user: null, event: CheckVersionEvent());
  }
}

class CheckVersionEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      yield await RestClient().checkVersion({
        'version': packageInfo.version,
        'code': packageInfo.buildNumber,
        'type': IO.Platform.isAndroid ? 'Android' : 'Ios'
      }).then((res) {
        if (res.result) {
          return currentState.copyWith(event: UserInfoEvent());
        } else {
          canLaunch(res.url).then((f) {
            if (f) {
              launch(res.url);
            }
          });
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
    try {
      yield await RestClient().getInfo().then((res) {
        return currentState.copyWith(
            user: res, event: PushRouteEvent(BasementRoute()));
      });
    } on DioError catch (_, stackTrace) {
      developer.log('$_',
          name: 'CheckVersionEvent', error: _, stackTrace: stackTrace);

      if (_?.response?.statusCode == 401) {
        yield currentState.copyWith(event: PushRouteEvent(BasementRoute()));
      } else {
        yield currentState.copyWith(
            event: ErrorEvent('Network connection failed!'));
      }
    }
  }
}

class PushRouteEvent extends AppEvent {
  final PageRouteInfo pageRouteInfo;

  PushRouteEvent(this.pageRouteInfo);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState;
  }
}

class AppLoginEvent extends AppEvent {
  final User user;
  final String token;
  final String password;

  AppLoginEvent(this.user, this.token, this.password);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    // TODO: implement applyAsync
    await Store.instance.setToken(token);
    await Store.instance
        .setAuth({'username': user.email, 'password': password});
    yield currentState.copyWith(
        user: user, event: PushRouteEvent(BasementRoute()));
  }
}

class AppLogoutEvent extends AppEvent {
  final BuildContext context;

  AppLogoutEvent(this.context);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    await Store.instance.clearToken();
    await Store.instance.clearAuth();
    context.router.replace(LoginRoute());
    yield currentState.copyWith(user: null);
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

class JMessageInitEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {}
}
