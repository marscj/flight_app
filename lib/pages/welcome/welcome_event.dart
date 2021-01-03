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

class LoadWelcomeEvent extends WelcomeEvent {
  final BuildContext context;

  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent(this.context);

  @override
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc}) async* {
    // ignore: close_sinks
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    yield InWelcomeState(1, null);

    try {
      yield await RestClient().getInfo().then((res) {
        return appBloc.add(Authorization(res));
      }).then((res) {
        return Future.delayed(Duration(milliseconds: 1)).then((res) {
          return InWelcomeState(1, BasementRoute());
        });
      });
    } catch (errors) {
      if (errors is DioError) {
        if (errors?.response?.statusCode == 401) {
          yield InWelcomeState(1, BasementRoute());
        }
      }
      yield ErrorWelcomeState(1, 'Connection timed out!');
    }
  }
}
