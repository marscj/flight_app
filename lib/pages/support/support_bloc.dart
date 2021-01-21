import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/support/index.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final SupportBloc _supportBlocSingleton = SupportBloc._internal();
  factory SupportBloc() {
    return _supportBlocSingleton;
  }
  SupportBloc._internal(): super(UnSupportState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  SupportState get initialState => UnSupportState(0);

  @override
  Stream<SupportState> mapEventToState(
    SupportEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SupportBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
