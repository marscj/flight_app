import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/bookings/index.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final BookingsBloc _bookingsBlocSingleton = BookingsBloc._internal();
  factory BookingsBloc() {
    return _bookingsBlocSingleton;
  }
  BookingsBloc._internal(): super(UnBookingsState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  BookingsState get initialState => UnBookingsState(0);

  @override
  Stream<BookingsState> mapEventToState(
    BookingsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'BookingsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
