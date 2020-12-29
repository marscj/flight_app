import 'package:saadiyat/index/index.dart';

/// Initialized
class InBasementState extends IndexState {
  InBasementState(int version) : super(version);

  @override
  String toString() => 'InBasementState';

  @override
  InBasementState getStateCopy() {
    return InBasementState(version);
  }

  @override
  InBasementState getNewVersion() {
    return InBasementState(version);
  }
}
