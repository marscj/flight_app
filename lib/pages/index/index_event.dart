import 'dart:async';

import 'package:meta/meta.dart';

import 'index_bloc.dart';
import 'index_state.dart';

@immutable
abstract class IndexEvent {
  Stream<IndexState> applyAsync({IndexState currentState, IndexBloc bloc});
}
