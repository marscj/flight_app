import 'dart:async';

import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';

class LoadLoginEvent extends IndexEvent {
  final bool loading;

  @override
  String toString() => 'LoadLoginEvent';

  LoadLoginEvent(this.loading);

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield InLoginState(0, loading);
  }
}
