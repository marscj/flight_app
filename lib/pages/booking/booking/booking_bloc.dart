import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks

  BookingBloc() : super(BookingState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<BookingState> mapEventToState(
    BookingEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'BookingBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
