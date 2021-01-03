// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..first_name = json['first_name'] as String
    ..last_name = json['last_name'] as String
    ..is_staff = json['is_staff'] as bool
    ..is_active = json['is_active'] as bool
    ..is_superuser = json['is_superuser'] as bool
    ..email = json['email'] as String
    ..department = json['department'] as String
    ..avatar = (json['avatar'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..possport_type = json['possport_type'] as String
    ..passport_code = json['passport_code'] as String
    ..passport_no = json['passport_no'] as String
    ..passport_sex = json['passport_sex'] as String
    ..passport_nationality = json['passport_nationality'] as String
    ..passport_date_birth = json['passport_date_birth'] as String
    ..passport_place_birth = json['passport_place_birth'] as String
    ..passport_date_issue = json['passport_date_issue'] as String
    ..passport_date_expiry = json['passport_date_expiry'] as String
    ..passport_issuing_authority = json['passport_issuing_authority'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'is_staff': instance.is_staff,
      'is_active': instance.is_active,
      'is_superuser': instance.is_superuser,
      'email': instance.email,
      'department': instance.department,
      'avatar': instance.avatar,
      'possport_type': instance.possport_type,
      'passport_code': instance.passport_code,
      'passport_no': instance.passport_no,
      'passport_sex': instance.passport_sex,
      'passport_nationality': instance.passport_nationality,
      'passport_date_birth': instance.passport_date_birth,
      'passport_place_birth': instance.passport_place_birth,
      'passport_date_issue': instance.passport_date_issue,
      'passport_date_expiry': instance.passport_date_expiry,
      'passport_issuing_authority': instance.passport_issuing_authority,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return Department()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TokenUser _$TokenUserFromJson(Map<String, dynamic> json) {
  return TokenUser()
    ..token = json['token'] as String
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TokenUserToJson(TokenUser instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return Booking()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..remark = json['remark'] as String
    ..date = json['date'] as String
    ..author = json['author'] as String;
}

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'remark': instance.remark,
      'date': instance.date,
      'author': instance.author,
    };

BookingList _$BookingListFromJson(Map<String, dynamic> json) {
  return BookingList()
    ..totalCount = json['totalCount'] as int
    ..pageNo = json['pageNo'] as int
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Booking.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BookingListToJson(BookingList instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageNo': instance.pageNo,
      'data': instance.data,
    };

BookingListExtra _$BookingListExtraFromJson(Map<String, dynamic> json) {
  return BookingListExtra()
    ..data = json['data'] == null
        ? null
        : BookingList.fromJson(json['data'] as Map<String, dynamic>)
    ..extra = json['extra'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BookingListExtraToJson(BookingListExtra instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://ubangservice.com/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<TokenUser> login(playload) async {
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/auth/login/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TokenUser.fromJson(_result.data);
    return value;
  }

  @override
  Future<User> getInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/auth/info/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }

  @override
  Future<User> updateUser(id, playload) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/users/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }

  @override
  Future<BookingListExtra> getBookings({query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/bookings/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BookingListExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<Booking> getBooking(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/bookings/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Booking.fromJson(_result.data);
    return value;
  }
}
