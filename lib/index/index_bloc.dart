import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/welcome/index.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final IndexBloc indexBlocSingleton = IndexBloc._internal();
  factory IndexBloc() {
    return indexBlocSingleton;
  }
  IndexBloc._internal() : super(InWelcomeState(0, 'SAADIYAT WAY'));

  @override
  Future<void> close() async {
    // dispose objects
    indexBlocSingleton.close();
    await super.close();
  }

  @override
  Stream<IndexState> mapEventToState(
    IndexEvent event,
  ) async* {
    try {
      print('-------');
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'IndexBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
