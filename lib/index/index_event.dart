import 'dart:async';

import 'package:saadiyat/index/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IndexEvent {
  Stream<IndexState> applyAsync({IndexState currentState, IndexBloc bloc});
  final IndexRepository indexRepository = IndexRepository();
}
