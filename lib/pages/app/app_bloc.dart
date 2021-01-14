import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final AppBloc _appBlocSingleton = AppBloc._internal();
  factory AppBloc() {
    return _appBlocSingleton;
  }
  AppBloc._internal(): super(UnAppState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  AppState get initialState => UnAppState(0);

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
