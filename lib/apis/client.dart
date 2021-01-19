import 'dart:io';

import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:saadiyat/constants.dart';
import 'package:saadiyat/store/store.dart';

part 'user.dart';
part 'booking.dart';
part 'client.g.dart';
part 'uploads.dart';
part 'itinerary.dart';
part 'comment.dart';
part 'ticket.dart';
part 'version.dart';

// ignore_for_file: non_constant_identifier_names

@RestApi(baseUrl: Constant.Host)
abstract class RestClient {
  factory RestClient() => _RestClient(Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ))
        ..interceptors
            .add(new InterceptorsWrapper(onRequest: (Options options) async {
          String token = await Store.instance.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'ACCESS_TOKEN ' + token;
          }
          return options;
        }, onResponse: (Response response) {
          response.data = response.data['result'];
          return response;
        }, onError: (DioError e) {
          if (e != null && e.response != null && e.response.data != null) {
            var data = e.response.data['result'] ?? e.response.data['detail'];
            var _data = Map<String, dynamic>();
            if (data != null) {
              data.forEach((k, v) {
                if (v is Iterable) {
                  _data[k] = v.join('\n');
                } else {
                  _data[k] = v;
                }
              });
              e?.response?.data = _data;
            }
          }

          return e;
        })));

  @POST('/auth/login/')
  Future<TokenUser> login(@Body() Map<String, dynamic> playload);

  @GET('/auth/info/')
  Future<User> getInfo();

  @PATCH('/auth/info/')
  Future<User> updateInfo(@Part() File avatar);

  @POST('/auth/password/change/')
  Future<ChangePasswordResult> changePassword(
      @Body() Map<String, dynamic> playload);

  @PATCH('/users/{id}/')
  Future<User> updateUser(
      @Path() int id, @Body() Map<String, dynamic> playload);

  @GET('/bookings/')
  Future<BookingListExtra> getBookings({@Queries() Map<String, dynamic> query});

  @POST('/bookings/')
  Future<BookingExtra> createBooking(@Body() Map<String, dynamic> playload);

  @GET('/bookings/{id}/')
  Future<BookingExtra> getBooking(@Path("id") int id);

  @PATCH('/bookings/{id}/')
  Future<BookingExtra> updateBooking(
      @Path("id") int id, @Body() Map<String, dynamic> playload);

  @GET('/itineraries/')
  Future<ItineraryList> getItinerarys({@Queries() Map<String, dynamic> query});

  @POST('/itineraries/')
  Future<ItineraryExtra> createItinerry(@Body() Map<String, dynamic> playload);

  @PATCH('/itineraries/{id}/')
  Future<ItineraryExtra> updateItinerary(
      @Path("id") int id, @Body() Map<String, dynamic> playload);

  @GET('/uploads/')
  Future<UploadList> getUploads({@Queries() Map<String, dynamic> query});

  @POST('/uploads/')
  Future<UploadExtra> upload(
      @Part() File file, @Part() int object_id, @Part() String content_type);

  @GET('/tickets/')
  Future<TicketListExtra> getTickets({@Queries() Map<String, dynamic> query});

  @GET('/tickets/{id}/')
  Future<TicketExtra> getTicket(@Path("id") int id);

  @POST('/app/version/')
  Future<Version> checkVersion(@Body() Map<String, dynamic> playload);
}
