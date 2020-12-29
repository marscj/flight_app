import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/settings/index.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final SettingsBloc _settingsBlocSingleton = SettingsBloc._internal();
  factory SettingsBloc() {
    return _settingsBlocSingleton;
  }
  SettingsBloc._internal(): super(UnSettingsState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  SettingsState get initialState => UnSettingsState(0);

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SettingsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
