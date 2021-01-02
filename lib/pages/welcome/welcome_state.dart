import 'package:saadiyat/pages/index/index_state.dart';

/// Initialized
class InWelcomeState extends IndexState {
  final String hello;

  InWelcomeState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InWelcomeState $hello';

  @override
  InWelcomeState getStateCopy() {
    return InWelcomeState(version, hello);
  }

  @override
  InWelcomeState getNewVersion() {
    return InWelcomeState(version + 1, hello);
  }
}
