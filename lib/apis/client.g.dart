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
    );
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
}
