import 'package:saadiyat/index/index.dart';

/// Initialized
class InHomeState extends IndexState {
  final String hello;

  InHomeState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InHomeState $hello';

  @override
  InHomeState getStateCopy() {
    return InHomeState(version, hello);
  }

  @override
  InHomeState getNewVersion() {
    return InHomeState(version + 1, hello);
  }
}
