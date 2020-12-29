import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/ticket/index.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final TicketBloc _ticketBlocSingleton = TicketBloc._internal();
  factory TicketBloc() {
    return _ticketBlocSingleton;
  }
  TicketBloc._internal() : super(UnTicketState(0));

  @override
  Future<void> close() async {
    await super.close();
  }

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'TicketBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
