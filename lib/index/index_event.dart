import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/index/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IndexEvent {
  Stream<IndexState> applyAsync({IndexState currentState, IndexBloc bloc});
  final IndexRepository indexRepository = IndexRepository();
}

class UnIndexEvent extends IndexEvent {
  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield UnIndexState(0);
  }
}

class LoadIndexEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadIndexEvent';

  LoadIndexEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      yield UnIndexState(0);
      await Future.delayed(Duration(seconds: 1));
      indexRepository.test(isError);
      yield InIndexState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadIndexEvent', error: _, stackTrace: stackTrace);
      yield ErrorIndexState(0, _?.toString());
    }
  }
}
