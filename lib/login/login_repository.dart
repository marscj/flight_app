import 'package:saadiyat/login/index.dart';

class LoginRepository {
  final LoginProvider _loginProvider = LoginProvider();

  LoginRepository();

  void test(bool isError) {
    _loginProvider.test(isError);
  }
}