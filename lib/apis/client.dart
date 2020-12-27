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
        ..interceptors.add(new InterceptorsWrapper(
          onRequest: (Options options) async {
            var token = await Store.instance.getToken();
            options.headers['Authorization'] = 'ACCESS_TOKEN ' + token;
            return options;
          },
          onResponse: (Response response) {
            response.data = response.data['result'];
            return response;
          },
        )));

  @POST('/auth/login/')
  Future<User> login();

  @GET('/auth/info/')
  Future<User> getInfo();

  @PATCH('/users/{id}/')
  Future<User> updateUser(
      @Path() int id, @Body() Map<String, dynamic> playload);
}
