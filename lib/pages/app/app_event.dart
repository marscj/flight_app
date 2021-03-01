import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:meta/meta.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/store/store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

import '../../constants.dart';

@immutable
abstract class AppEvent {
  PageRouteInfo get pageRouteInfo => null;

  String get errorMessage => null;

  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc});
}

class AppInitEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    // 电源管理
    Wakelock.enable();

    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    yield currentState.copyWith(
        version: Constant.APP_VERSION,
        code: Constant.APP_CODE,
        user: null,
        event: CheckVersionEvent());
  }
}

class CheckVersionEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    try {
      yield await RestClient().checkVersion({
        'version': currentState?.version ?? '1.0.0',
        'code': currentState?.code ?? '1',
        'type': Platform.isAndroid ? 'Android' : 'Ios'
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
        bloc.add(JMessageLoginEvent());
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
    await Store.instance.setToken(token);
    await Store.instance.setAuth([user.email, password]);
    bloc.add(JMessageLoginEvent());
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
    // context.router.popAndPush(LoginRoute());

    context.router.removeUntilRoot();
    context.router.replace(LoginRoute());
    bloc.add(JMessageLogoutEvent());
    yield currentState.copyWith(user: null);
  }
}

class AppChangePasswordEvent extends AppEvent {
  final String password;

  AppChangePasswordEvent(this.password);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    await Store.instance.setAuth([currentState.user.email, password]);
    yield currentState;
  }
}

class AppChangeAvatarEvent extends AppEvent {
  final File avatar;

  AppChangeAvatarEvent(this.avatar);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield await RestClient().updateInfo(avatar).then((user) {
      return currentState.copyWith(user: user);
    }).catchError((res) {
      return currentState.copyWith(event: ErrorEvent('Upload failed!'));
    });
  }
}

class ErrorEvent extends AppEvent {
  final String errorMessage;

  ErrorEvent(this.errorMessage);

  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    yield currentState;
  }
}

class JMessageLoginEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    var auth = await Store.instance.getAuth();

    if (auth != null) {
      try {
        await JMessage.login(username: auth[0], password: auth[1]);
      } on PlatformException catch (_) {
        print(_.toString());
      }
    }
  }
}

class JMessageLogoutEvent extends AppEvent {
  @override
  Stream<AppState> applyAsync({AppState currentState, AppBloc bloc}) async* {
    try {
      await JMessage.logout();
    } on PlatformException catch (_) {
      print(_.toString());
    }
  }
}
