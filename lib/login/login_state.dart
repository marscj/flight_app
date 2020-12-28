import 'package:saadiyat/index/index.dart';

/// Initialized
class InLoginState extends IndexState {
  final bool loading;

  InLoginState(int version, this.loading) : super(version, [loading]);

  @override
  String toString() => 'InLoginState $loading';

  @override
  InLoginState getStateCopy() {
    return InLoginState(version, loading);
  }

  @override
  InLoginState getNewVersion() {
    return InLoginState(version + 1, loading);
  }
}
