// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..username = json['username'] as String
    ..name = json['name'] as String
    ..first_name = json['first_name'] as String
    ..last_name = json['last_name'] as String
    ..is_staff = json['is_staff'] as bool
    ..is_active = json['is_active'] as bool
    ..is_superuser = json['is_superuser'] as bool
    ..email = json['email'] as String
    ..role = json['role'] as int
    ..photo = (json['photo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'is_staff': instance.is_staff,
      'is_active': instance.is_active,
      'is_superuser': instance.is_superuser,
      'email': instance.email,
      'role': instance.role,
      'photo': instance.photo,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestService implements RestService {
  _RestService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://127.0.0.1:8000/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<User> getInfo({query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/users/info/',
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
  Future<User> uploadPhoto(id, photo) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(photo, 'photo');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'photo',
        MultipartFile.fromFileSync(photo.path,
            filename: photo.path.split(Platform.pathSeparator).last)));
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
