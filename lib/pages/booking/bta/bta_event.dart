import 'dart:async';

import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';

import 'bta_bloc.dart';
import 'bta_state.dart';

@immutable
abstract class BtaEvent {
  Stream<BtaState> applyAsync({BtaState currentState, BtaBloc bloc});
}

class RefreshBtaEvent extends BtaEvent {
  final UploadList result;

  RefreshBtaEvent(this.result);

  @override
  Stream<BtaState> applyAsync({BtaState currentState, BtaBloc bloc}) async* {
    yield currentState.copyWith(list: result?.data ?? []);
  }
}
