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
    ..author = json['author'] as String
    ..uploads = (json['uploads'] as List)
        ?.map((e) =>
            e == null ? null : Upload.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..itineraries = (json['itineraries'] as List)
        ?.map((e) =>
            e == null ? null : Itinerary.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'remark': instance.remark,
      'date': instance.date,
      'author': instance.author,
      'uploads': instance.uploads,
      'itineraries': instance.itineraries,
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

BookingExtra _$BookingExtraFromJson(Map<String, dynamic> json) {
  return BookingExtra()
    ..data = json['data'] == null
        ? null
        : Booking.fromJson(json['data'] as Map<String, dynamic>)
    ..extra = json['extra'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BookingExtraToJson(BookingExtra instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
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

Upload _$UploadFromJson(Map<String, dynamic> json) {
  return Upload()
    ..id = json['id'] as int
    ..content_type = json['content_type'] as String
    ..author_id = json['author_id'] as int
    ..name = json['name'] as String
    ..url = json['url'] as String
    ..uid = json['uid'] as String
    ..remark = json['remark'] as String
    ..file = json['file'] as String
    ..date = json['date'] as String
    ..object_id = json['object_id'] as int;
}

Map<String, dynamic> _$UploadToJson(Upload instance) => <String, dynamic>{
      'id': instance.id,
      'content_type': instance.content_type,
      'author_id': instance.author_id,
      'name': instance.name,
      'url': instance.url,
      'uid': instance.uid,
      'remark': instance.remark,
      'file': instance.file,
      'date': instance.date,
      'object_id': instance.object_id,
    };

UploadExtra _$UploadExtraFromJson(Map<String, dynamic> json) {
  return UploadExtra()
    ..data = json['data'] == null
        ? null
        : Upload.fromJson(json['data'] as Map<String, dynamic>)
    ..extra = json['extra'] as Map<String, dynamic>;
}

Map<String, dynamic> _$UploadExtraToJson(UploadExtra instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
    };

UploadList _$UploadListFromJson(Map<String, dynamic> json) {
  return UploadList()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Upload.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UploadListToJson(UploadList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) {
  return Itinerary()
    ..id = json['id'] as int
    ..serial_no = json['serial_no'] as String
    ..email = json['email'] as String
    ..name = json['name'] as String
    ..passport_no = json['passport_no'] as String
    ..entry = json['entry'] as String
    ..exit = json['exit'] as String
    ..ticket1 = json['ticket1'] as String
    ..ticket2 = json['ticket2'] as String
    ..hotel = json['hotel'] as String
    ..is_lock = json['is_lock'] as bool
    ..remark = json['remark'] as String
    ..booking_id = json['booking_id'] as int
    ..date = json['date'] as String;
}

Map<String, dynamic> _$ItineraryToJson(Itinerary instance) => <String, dynamic>{
      'id': instance.id,
      'serial_no': instance.serial_no,
      'email': instance.email,
      'name': instance.name,
      'passport_no': instance.passport_no,
      'entry': instance.entry,
      'exit': instance.exit,
      'ticket1': instance.ticket1,
      'ticket2': instance.ticket2,
      'hotel': instance.hotel,
      'is_lock': instance.is_lock,
      'remark': instance.remark,
      'booking_id': instance.booking_id,
      'date': instance.date,
    };

ItineraryExtra _$ItineraryExtraFromJson(Map<String, dynamic> json) {
  return ItineraryExtra()
    ..data = json['data'] == null
        ? null
        : Itinerary.fromJson(json['data'] as Map<String, dynamic>)
    ..extra = json['extra'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ItineraryExtraToJson(ItineraryExtra instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
    };

ItineraryList _$ItineraryListFromJson(Map<String, dynamic> json) {
  return ItineraryList()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Itinerary.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ItineraryListToJson(ItineraryList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment()
    ..id = json['id'] as int
    ..comment = json['comment'] as String
    ..rating = json['rating'] as int
    ..read = json['read'] as bool
    ..content_type = json['content_type'] as String
    ..author_id = json['author_id'] as int
    ..date = json['date'] as String
    ..object_id = json['object_id'] as int;
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
      'read': instance.read,
      'content_type': instance.content_type,
      'author_id': instance.author_id,
      'date': instance.date,
      'object_id': instance.object_id,
    };

CommentList _$CommentListFromJson(Map<String, dynamic> json) {
  return CommentList()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CommentListToJson(CommentList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return Ticket()
    ..id = json['id'] as int
    ..serial_no = json['serial_no'] as String
    ..air_line = json['air_line'] as String
    ..air_info = json['air_info'] as String
    ..air_class = json['air_class'] as String
    ..fare = (json['fare'] as num)?.toDouble()
    ..tax = (json['tax'] as num)?.toDouble()
    ..total = (json['total'] as num)?.toDouble()
    ..remark = json['remark'] as String
    ..is_confirm = json['is_confirm'] as bool
    ..is_cancel = json['is_cancel'] as bool
    ..is_booking = json['is_booking'] as bool
    ..is_complete = json['is_complete'] as bool
    ..date = json['date'] as String
    ..itinerary = json['itinerary'] == null
        ? null
        : Itinerary.fromJson(json['itinerary'] as Map<String, dynamic>)
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..uploads = (json['uploads'] as List)
        ?.map((e) =>
            e == null ? null : Upload.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'serial_no': instance.serial_no,
      'air_line': instance.air_line,
      'air_info': instance.air_info,
      'air_class': instance.air_class,
      'fare': instance.fare,
      'tax': instance.tax,
      'total': instance.total,
      'remark': instance.remark,
      'is_confirm': instance.is_confirm,
      'is_cancel': instance.is_cancel,
      'is_booking': instance.is_booking,
      'is_complete': instance.is_complete,
      'date': instance.date,
      'itinerary': instance.itinerary,
      'comments': instance.comments,
      'uploads': instance.uploads,
    };

TicketList _$TicketListFromJson(Map<String, dynamic> json) {
  return TicketList()
    ..totalCount = json['totalCount'] as int
    ..pageNo = json['pageNo'] as int
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TicketListToJson(TicketList instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageNo': instance.pageNo,
      'data': instance.data,
    };

TicketExtra _$TicketExtraFromJson(Map<String, dynamic> json) {
  return TicketExtra()
    ..data = json['data'] == null
        ? null
        : Ticket.fromJson(json['data'] as Map<String, dynamic>)
    ..extra = json['extra'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TicketExtraToJson(TicketExtra instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
    };

TicketListExtra _$TicketListExtraFromJson(Map<String, dynamic> json) {
  return TicketListExtra()
    ..data = json['data'] == null
        ? null
        : TicketList.fromJson(json['data'] as Map<String, dynamic>)
    ..extra = json['extra'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TicketListExtraToJson(TicketListExtra instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
    };

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version()
    ..result = json['result'] as bool
    ..url = json['url'] as String;
}

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'result': instance.result,
      'url': instance.url,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://thesaadiyat.com/api/';
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
  Future<BookingExtra> createBooking(playload) async {
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/bookings/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BookingExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<BookingExtra> getBooking(id) async {
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
    final value = BookingExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<BookingExtra> updateBooking(id, playload) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/bookings/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BookingExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<ItineraryList> getItinerarys({query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/itineraries/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ItineraryList.fromJson(_result.data);
    return value;
  }

  @override
  Future<ItineraryExtra> createItinerry(playload) async {
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/itineraries/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ItineraryExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<ItineraryExtra> updateItinerary(id, playload) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/itineraries/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ItineraryExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<UploadList> getUploads({query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/uploads/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UploadList.fromJson(_result.data);
    return value;
  }

  @override
  Future<UploadExtra> upload(file, object_id, content_type) async {
    ArgumentError.checkNotNull(file, 'file');
    ArgumentError.checkNotNull(object_id, 'object_id');
    ArgumentError.checkNotNull(content_type, 'content_type');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    if (object_id != null) {
      _data.fields.add(MapEntry('object_id', object_id.toString()));
    }
    if (content_type != null) {
      _data.fields.add(MapEntry('content_type', content_type));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/uploads/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UploadExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<TicketListExtra> getTickets({query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/tickets/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TicketListExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<TicketExtra> getTicket(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/tickets/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TicketExtra.fromJson(_result.data);
    return value;
  }

  @override
  Future<Version> checkVersion(playload) async {
    ArgumentError.checkNotNull(playload, 'playload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(playload ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/app/version/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Version.fromJson(_result.data);
    return value;
  }
}
