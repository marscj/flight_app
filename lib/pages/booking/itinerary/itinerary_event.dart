import 'dart:async';

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking/itinerary/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItineraryEvent {
  Stream<ItineraryState> applyAsync(
      {ItineraryState currentState, ItineraryBloc bloc});
}

class RefreshItineraryEvent extends ItineraryEvent {
  final ItineraryListExtra result;

  RefreshItineraryEvent(this.result);

  @override
  Stream<ItineraryState> applyAsync(
      {ItineraryState currentState, ItineraryBloc bloc}) async* {
    yield currentState.copyWith(list: result?.data?.data ?? []);
  }
}
