import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'bta_event.dart';
import 'bta_state.dart';

class BtaBloc extends Bloc<BtaEvent, BtaState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  BtaBloc() : super(BtaState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<BtaState> mapEventToState(
    BtaEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'BtaBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
