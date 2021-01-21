import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/support/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SupportEvent {
  Stream<SupportState> applyAsync(
      {SupportState currentState, SupportBloc bloc});
}

class RefreshSupportDetailEvent extends SupportEvent {
  final List<Comment> list;

  RefreshSupportDetailEvent(this.list);

  @override
  Stream<SupportState> applyAsync(
      {SupportState currentState, SupportBloc bloc}) async* {
    yield currentState.copyWith(list: list);
  }
}
