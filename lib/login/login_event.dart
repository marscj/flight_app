import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:meta/meta.dart';

class UnLoginEvent extends IndexEvent {
  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield UnLoginState(0);
  }
}

class LoadLoginEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadLoginEvent';

  LoadLoginEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      yield UnLoginState(0);
      await Future.delayed(Duration(seconds: 1));
      indexRepository.test(isError);
      yield InLoginState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState(0, _?.toString());
    }
  }
}
