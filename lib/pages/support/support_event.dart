import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/pages/support/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SupportEvent {
  Stream<SupportState> applyAsync(
      {SupportState currentState, SupportBloc bloc});
}
