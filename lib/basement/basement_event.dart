import 'dart:async';

import 'package:saadiyat/basement/index.dart';
import 'package:saadiyat/index/index.dart';

class LoadBasementEvent extends IndexEvent {
  @override
  String toString() => 'LoadBasementEvent';

  LoadBasementEvent();

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    try {
      yield InBasementState(2);
    } catch (_) {}
  }
}
