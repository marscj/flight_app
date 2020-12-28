import 'dart:async';

import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';

class LoadLoginEvent extends IndexEvent {
  @override
  String toString() => 'LoadLoginEvent';

  LoadLoginEvent();

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield InLoginState(0, false);
    // try {

    // } catch (_, stackTrace) {
    //   developer.log('$_',
    //       name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
    //   yield ErrorIndexState(0, _?.toString());
    // }
  }
}
