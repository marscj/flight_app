import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';

class LoadLoginEvent extends IndexEvent {
  final bool isError;
  @override
  String toString() => 'LoadLoginEvent';

  LoadLoginEvent(this.isError);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      await Future.delayed(Duration(seconds: 1));
      indexRepository.test(isError);
      yield InLoginState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorIndexState(0, _?.toString());
    }
  }
}
