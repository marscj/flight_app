import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/index/index.dart';

abstract class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc(IndexState initialState) : super(initialState);

  // todo: check singleton for logic in project
  // use GetIt for DI in projct

  // static final IndexBloc _indexBlocSingleton = IndexBloc._internal();
  // factory IndexBloc() {
  //   return _indexBlocSingleton;
  // }
  // IndexBloc._internal() : super(UnIndexState(0));

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  IndexState get initialState => UnIndexState(0);

  @override
  Stream<IndexState> mapEventToState(
    IndexEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'IndexBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
