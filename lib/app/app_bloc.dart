import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:wakelock/wakelock.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../store/store.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial());

  StreamSubscription<int> controller;

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppInitial) {
      // 电源管理
      await Wakelock.enable();

      // 强制竖屏
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      // 获取language
      yield await Store.instance.getLanguage().then((value) {
        return state.copyWith(locale: Locale(value, ''));
      });

      add(WelcomStartTime());
    }

    // if (event is WelcomStartTime) {
    //   controller?.cancel();
    //   controller =
    //       RangeStream(5, 0).interval(Duration(seconds: 1)).doOnDone(() {
    //     add(AuthenticationStart());
    //   }).listen((i) => add(WelcomUpdateTime(i)));

    //   yield state.copyWith(leftTime: 5);
    // }

    // if (event is WelcomUpdateTime) {
    //   yield state.copyWith(leftTime: event.leftTime);
    // }

    // if (event is WelcomStopTime) {
    //   controller?.cancel();
    //   yield state.copyWith(leftTime: 0);
    // }

    // if (event is AuthenticationStart) {
    //   yield state.copyWith(status: AppStatus.Authenticating);

    //   yield await RestClient().getInfo().then<AppState>((user) {
    //     return state.copyWith(user: user, status: AppStatus.AuthorizedState);
    //   }).catchError((onError) {
    //     return state.copyWith(status: AppStatus.UnAuthorizedState);
    //   });
    // }

    // if (event is SignOut) {
    //   await Store.instance.clearToken();
    //   yield state.copyWith(status: AppStatus.UnAuthorizedState);
    // }

    // if (event is SwitchLanguage) {
    //   yield await Store.instance
    //       .setLanguage(event.locale.languageCode)
    //       .then((value) {
    //     return state.copyWith(locale: event.locale);
    //   });
    // }

    // if (event is UpdateAppUser) {
    //   yield state.copyWith(user: event.user);
    // }
  }
}
