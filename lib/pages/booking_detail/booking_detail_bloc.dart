import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/booking_detail/index.dart';

class BookingDetailBloc extends Bloc<BookingDetailEvent, BookingDetailState> {
  BookingDetailBloc() : super(BookingDetailState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<BookingDetailState> mapEventToState(
    BookingDetailEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'BookingDetailBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
