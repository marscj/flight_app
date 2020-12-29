import 'dart:async';

import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';

class LoadHomeEvent extends IndexEvent {
  @override
  String toString() => 'LoadHomeEvent';

  LoadHomeEvent();

  @override
  Stream<IndexState> applyAsync(
      {IndexState currentState, IndexBloc bloc}) async* {
    yield InHomeState(0);
  }
}
