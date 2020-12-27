import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/welcome/index.dart';

class LoadWelcomeEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadWelcomeEvent';

  LoadWelcomeEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      indexRepository.loadUser();
      yield InWelcomeState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWelcomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorIndexState(0, _?.toString());
    }
  }
}
