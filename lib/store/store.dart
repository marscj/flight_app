import 'package:shared_preferences/shared_preferences.dart';

class Store<T> {
  static Store get instance => Store._();

  Store._();

  Future<String> getLanguage() async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.getString('language') ?? 'en';
    });
  }

  Future<bool> setLanguage(language) async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.setString('language', language);
    });
  }

  Future<String> getToken() async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.getString('token');
    });
  }

  Future<bool> setToken(token) async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.setString('token', token);
    });
  }

  Future<bool> clearToken() async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.remove('token');
    });
  }

  Future<List<String>> getAuth() async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.getStringList('auth');
    });
  }

  Future<void> setAuth(auth) async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.setStringList('auth', auth);
    });
  }

  Future<void> clearAuth() async {
    return SharedPreferences.getInstance().then((sp) {
      return sp.remove('auth');
    });
  }
}
