import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/booking/index.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  static final BookingBloc _bookingBlocSingleton = BookingBloc._internal();
  factory BookingBloc() {
    return _bookingBlocSingleton;
  }
  BookingBloc._internal() : super(UnBookingState(0));

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
