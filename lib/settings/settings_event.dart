import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/settings/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SettingsEvent {
  Stream<SettingsState> applyAsync(
      {SettingsState currentState, SettingsBloc bloc});
}

class UnSettingsEvent extends SettingsEvent {
  @override
  Stream<SettingsState> applyAsync(
      {SettingsState currentState, SettingsBloc bloc}) async* {
    yield UnSettingsState(0);
  }
}

class LoadSettingsEvent extends SettingsEvent {
  final bool isError;
  @override
  String toString() => 'LoadSettingsEvent';

  LoadSettingsEvent(this.isError);

  @override
  Stream<SettingsState> applyAsync(
      {SettingsState currentState, SettingsBloc bloc}) async* {
    try {
      yield UnSettingsState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSettingsEvent', error: _, stackTrace: stackTrace);
      yield ErrorSettingsState(0, _?.toString());
    }
  }
}
