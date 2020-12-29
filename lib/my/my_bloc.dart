import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/my/index.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final MyBloc _myBlocSingleton = MyBloc._internal();
  factory MyBloc() {
    return _myBlocSingleton;
  }
  MyBloc._internal() : super(UnMyState(0));

  @override
  Future<void> close() async {
    // dispose objects
    _myBlocSingleton.close();
    await super.close();
  }

  @override
  MyState get initialState => UnMyState(0);

  @override
  Stream<MyState> mapEventToState(
    MyEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'MyBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
