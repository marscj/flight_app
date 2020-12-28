import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:saadiyat/welcome/index.dart';

class LoadWelcomeEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield InWelcomeState(0, 'SAADIYAT WAY');

    try {
      await Future.delayed(Duration(seconds: 2)).then((rews) {
        return RestClient().getInfo().then((res) {
          bloc.add(LoadHomeEvent(false));
        });
      });
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWelcomeEvent', error: _, stackTrace: stackTrace);

      if (_ is DioError) {
        bloc.add(LoadLoginEvent(false));
      } else {
        yield ErrorIndexState(0, _?.toString());
      }
    }
  }
}
