import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/index/index.dart';

class LoadHomeEvent extends IndexEvent {
  @override
  String toString() => 'LoadHomeEvent';

  LoadHomeEvent();

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {} catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadHomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorIndexState(0, _?.toString());
    }
  }
}
