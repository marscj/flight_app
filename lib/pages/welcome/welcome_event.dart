import 'dart:async';

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

    // yield InWelcomeState(1, null);

    try {
      RestClient().getInfo().then((res) {
        return 0;
        // appBloc.add(Authorization(res));
      }).then((res) {
        return InWelcomeState(2, BasementRoute());
      });
    } catch (_) {
      yield InWelcomeState(1, LoginRoute());
    }
  }
}
