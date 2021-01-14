import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  AppBloc() : super(AppState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AppBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
