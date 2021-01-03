import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'bookings_event.dart';
import 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  static final BookingsBloc _bookingsBlocSingleton = BookingsBloc._internal();
  factory BookingsBloc() {
    return _bookingsBlocSingleton;
  }
  BookingsBloc._internal() : super(BookingsState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<BookingsState> mapEventToState(
    BookingsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'BookingsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
