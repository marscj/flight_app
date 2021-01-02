import 'dart:async';

import 'package:saadiyat/pages/index/index_bloc.dart';
import 'package:saadiyat/pages/index/index_event.dart';
import 'package:saadiyat/pages/index/index_state.dart';

import 'basement_state.dart';

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
