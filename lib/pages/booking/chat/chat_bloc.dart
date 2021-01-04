import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:saadiyat/pages/booking/chat/index.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  // ignore: close_sinks
  ChatBloc() : super(ChatState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ChatBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
