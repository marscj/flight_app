import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:saadiyat/store/store.dart';

import '../constanc.dart';

part 'user.dart';
part 'client.g.dart';

@RestApi(baseUrl: Constant.Host)
abstract class RestClient {
  factory RestClient() => _RestClient(Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ))
        ..interceptors
            .add(new InterceptorsWrapper(onRequest: (Options options) async {
          var token = await Store.instance.getToken();
          options.headers['Authorization'] = token;
          return options;
        }, onResponse: (Response response) {
          response.data = response.data['result'];
          return response;
        }, onError: (DioError e) async {
          if (e?.response?.statusCode == 400) {
            // e?.response?.data = e?.response?.data['result'];
            var data = e?.response?.data['result'];
            if (data != null) {
              data.forEach((k, v) {
                if (v is Iterable) {
                  data[k] = v.join('\n');
                } else {
                  data[k] = v;
                }
              });
              e?.response?.data = data;
            }
          } else if (e?.response?.statusCode == 401) {
            Store.instance.clearToken();
          }
          return e;
        })));

  @GET('/auth/login/')
  Future<User> login({@Queries() Map<String, dynamic> query});

  @GET('/users/info/')
  Future<User> getInfo({@Queries() Map<String, dynamic> query});

  @PATCH('/users/{id}/')
  Future<User> updateUser(
      @Path() int id, @Body() Map<String, dynamic> playload);
}
