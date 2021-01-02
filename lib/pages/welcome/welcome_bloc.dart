import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/welcome/index.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  static final WelcomeBloc _welcomeBlocSingleton = WelcomeBloc._internal();
  factory WelcomeBloc() {
    return _welcomeBlocSingleton;
  }
  WelcomeBloc._internal() : super(InWelcomeState(0, 'SAADIYAT WAY'));

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<WelcomeState> mapEventToState(
    WelcomeEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'WelcomeBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
