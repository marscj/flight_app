import 'dart:async';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/app/app_bloc.dart';
import 'package:saadiyat/pages/basement/index.dart';
import 'package:saadiyat/pages/index/index_bloc.dart';
import 'package:saadiyat/pages/index/index_event.dart';
import 'package:saadiyat/pages/index/index_state.dart';
import 'package:saadiyat/pages/login/index.dart';

import 'welcome_state.dart';

class LoadWelcomeEvent extends IndexEvent {
  final AppBloc appBloc;

  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent(this.appBloc);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield InWelcomeState(0, 'SAADIYAT WAY');

    try {
      await Future.delayed(Duration(seconds: 2)).then((rews) {
        return RestClient().getInfo().then((res) {
          appBloc.add(UpdateAppUser(res));
          bloc.add(LoadBasementEvent());
        });
      });
    } catch (_) {
      bloc.add(LoadLoginEvent(false));
      yield InWelcomeState(0, 'SAADIYAT WAY');
    }
  }
}
