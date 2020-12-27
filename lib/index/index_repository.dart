import 'package:saadiyat/index/index.dart';

class IndexRepository {
  final IndexProvider _indexProvider = IndexProvider();

  IndexRepository();

  void test(bool isError) {
    _indexProvider.test(isError);
  }
}