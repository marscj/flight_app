import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';

class UnHomeEvent extends IndexEvent {
  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield UnHomeState(0);
  }
}

class LoadHomeEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadHomeEvent';

  LoadHomeEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      yield UnHomeState(0);
      await Future.delayed(Duration(seconds: 1));
      indexRepository.test(isError);
      yield InHomeState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(0, _?.toString());
    }
  }
}
