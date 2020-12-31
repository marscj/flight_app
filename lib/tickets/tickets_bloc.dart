import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/tickets/index.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final TicketsBloc _ticketsBlocSingleton = TicketsBloc._internal();
  factory TicketsBloc() {
    return _ticketsBlocSingleton;
  }
  TicketsBloc._internal() : super(UnTicketsState(0));

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<TicketsState> mapEventToState(
    TicketsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'TicketsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
