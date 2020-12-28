import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:wakelock/wakelock.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../store/store.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial());

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
  }
}
