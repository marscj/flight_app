import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/booking/itinerary/index.dart';

class ItineraryBloc extends Bloc<ItineraryEvent, ItineraryState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  static final ItineraryBloc _itineraryBlocSingleton =
      ItineraryBloc._internal();
  factory ItineraryBloc() {
    return _itineraryBlocSingleton;
  }
  ItineraryBloc._internal() : super(ItineraryState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<ItineraryState> mapEventToState(
    ItineraryEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ItineraryBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
