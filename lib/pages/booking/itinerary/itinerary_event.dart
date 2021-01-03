import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/pages/booking/itinerary/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItineraryEvent {
  Stream<ItineraryState> applyAsync(
      {ItineraryState currentState, ItineraryBloc bloc});
}

class UnItineraryEvent extends ItineraryEvent {
  @override
  Stream<ItineraryState> applyAsync(
      {ItineraryState currentState, ItineraryBloc bloc}) async* {
    yield UnItineraryState(0);
  }
}

class LoadItineraryEvent extends ItineraryEvent {
  final bool isError;
  @override
  String toString() => 'LoadItineraryEvent';

  LoadItineraryEvent(this.isError);

  @override
  Stream<ItineraryState> applyAsync(
      {ItineraryState currentState, ItineraryBloc bloc}) async* {
    try {
      yield UnItineraryState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadItineraryEvent', error: _, stackTrace: stackTrace);
      yield ErrorItineraryState(0, _?.toString());
    }
  }
}
