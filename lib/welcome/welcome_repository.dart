import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/welcome/index.dart';

class WelcomeRepository {
  WelcomeRepository();

  void test(bool isError) {
    if (isError == true) {
      throw Exception('manual error');
    }
  }

  Future<User> loadUser() async {
    return await RestClient().getInfo();
  }
}
