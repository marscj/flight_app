import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final TicketDetailBloc _ticketDetailBlocSingleton = TicketDetailBloc._internal();
  factory TicketDetailBloc() {
    return _ticketDetailBlocSingleton;
  }
  TicketDetailBloc._internal(): super(UnTicketDetailState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  TicketDetailState get initialState => UnTicketDetailState(0);

  @override
  Stream<TicketDetailState> mapEventToState(
    TicketDetailEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'TicketDetailBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
