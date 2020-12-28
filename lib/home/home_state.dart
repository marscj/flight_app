import 'package:saadiyat/index/index.dart';

/// Initialized
class InHomeState extends IndexState {
  InHomeState(int version) : super(version);

  @override
  String toString() => 'InHomeState';

  @override
  InHomeState getStateCopy() {
    return InHomeState(version);
  }

  @override
  InHomeState getNewVersion() {
    return InHomeState(version + 1);
  }
}
