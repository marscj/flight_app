import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:saadiyat/pages/welcome/index.dart';
import 'package:meta/meta.dart';
import 'package:saadiyat/router/router.gr.dart';

@immutable
abstract class WelcomeEvent {
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc});
}

class CheckVersionEvent extends WelcomeEvent {
  final AppBloc appBloc;

  CheckVersionEvent(this.appBloc);

  @override
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc}) async* {
    bloc.add(UserInfoEvent(appBloc));
    yield currentState;
  }
}

class UserInfoEvent extends WelcomeEvent {
  final AppBloc appBloc;

  UserInfoEvent(this.appBloc);

  @override
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc}) async* {
    try {
      yield await RestClient().getInfo().then((res) {
        return appBloc.add(Authorization(res));
      }).then((res) {
        return Future.delayed(Duration(seconds: 1)).then((res) {
          return InWelcomeState(1, BasementRoute());
        });
      });
    } catch (errors) {
      if (errors is DioError) {
        if (errors?.response?.statusCode == 401) {
          yield InWelcomeState(1, BasementRoute());
        }
      } else {
        yield ErrorWelcomeState(1, 'Connection timed out!');
      }
    }
  }
}
