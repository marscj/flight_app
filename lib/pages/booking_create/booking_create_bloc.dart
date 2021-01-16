import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/booking_create/index.dart';

class BookingCreateBloc extends Bloc<BookingCreateEvent, BookingCreateState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  BookingCreateBloc() : super(BookingCreateState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<BookingCreateState> mapEventToState(
    BookingCreateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'BookingCreateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
