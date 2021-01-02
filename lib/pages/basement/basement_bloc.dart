import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/basement/index.dart';

class BasementBloc extends Bloc<BasementEvent, BasementState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  static final BasementBloc _basementBlocSingleton = BasementBloc._internal();
  factory BasementBloc() {
    return _basementBlocSingleton;
  }
  BasementBloc._internal() : super(InBasementState(0));

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<BasementState> mapEventToState(
    BasementEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'BasementBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
