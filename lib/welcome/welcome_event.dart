import 'dart:async';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/basement/index.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:saadiyat/welcome/index.dart';

class LoadWelcomeEvent extends IndexEvent {
  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent();

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield InWelcomeState(0, 'SAADIYAT WAY');

    try {
      await Future.delayed(Duration(seconds: 2)).then((rews) {
        return RestClient().getInfo().then((res) {
          bloc.add(LoadBasementEvent());
        });
      });
    } catch (_) {
      bloc.add(LoadLoginEvent(false));
      yield InWelcomeState(0, 'SAADIYAT WAY');
    }
  }
}
