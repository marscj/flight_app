import 'package:saadiyat/index/index.dart';

/// Initialized
class InLoginState extends IndexState {
  final String hello;

  InLoginState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InLoginState $hello';

  @override
  InLoginState getStateCopy() {
    return InLoginState(version, hello);
  }

  @override
  InLoginState getNewVersion() {
    return InLoginState(version + 1, hello);
  }
}
