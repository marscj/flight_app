import 'package:saadiyat/welcome/index.dart';

class WelcomeRepository {
  final WelcomeProvider _welcomeProvider = WelcomeProvider();

  WelcomeRepository();

  void test(bool isError) {
    _welcomeProvider.test(isError);
  }
}