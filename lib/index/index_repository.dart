import 'package:saadiyat/apis/client.dart';

class IndexRepository {
  IndexRepository();

  void test(bool isError) {
    if (isError == true) {
      throw Exception('manual error');
    }
  }

  Future<User> loadUser() async {
    return RestClient().getInfo();
  }
}
