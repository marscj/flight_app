import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/welcome/index.dart';
import 'package:meta/meta.dart';

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
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    try {
      yield await Future.delayed(Duration(seconds: 2)).then((rews) {
        return RestClient().getInfo().then((res) {
          // return appBloc.add(UpdateAppUser(res));
        }).then((res) {
          return InWelcomeState(0, 'SAADIYAT WAY');
        });
      });
    } catch (_) {}
  }
}
