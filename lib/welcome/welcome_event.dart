import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/welcome/index.dart';

class UnWelcomeEvent extends IndexEvent {
  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield UnWelcomeState(0);
  }
}

class LoadWelcomeEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      yield UnWelcomeState(0);
      await Future.delayed(Duration(seconds: 1));
      indexRepository.test(isError);
      yield InWelcomeState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWelcomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorWelcomeState(0, _?.toString());
    }
  }
}
