import 'package:saadiyat/apis/client.dart';

class IndexRepository {
  IndexRepository();

  void test(bool isError) {
    if (isError == true) {
      throw Exception('manual error');
    }
  }

  Future<User> ftechUser() async {
    return RestClient().getInfo();
  }
}
