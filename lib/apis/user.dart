part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class User extends Equatable {
  int id;
  String name;
  String first_name;
  String last_name;
  bool is_staff;
  bool is_active;
  bool is_superuser;
  String email;
  String department;
  Map<String, String> avatar;

  String possport_type;
  String passport_code;
  String passport_no;
  String passport_sex;
  String passport_nationality;
  String passport_date_birth;
  String passport_place_birth;
  String passport_date_issue;
  String passport_date_expiry;
  String passport_issuing_authority;

  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [
        id,
        first_name,
        last_name,
        is_staff,
        is_active,
        is_superuser,
        avatar,
        email,
        department,
        possport_type,
        passport_code,
        passport_no,
        passport_sex,
        passport_nationality,
        passport_date_birth,
        passport_place_birth,
        passport_date_issue,
        passport_date_expiry,
        passport_issuing_authority,
      ];
}

@JsonSerializable()
class Department extends Equatable {
  int id;
  String name;

  static Department fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

  @override
  List<Object> get props => [id, name];
}

@JsonSerializable()
class TokenUser extends Equatable {
  String token;
  User user;

  static TokenUser fromJson(Map<String, dynamic> json) =>
      _$TokenUserFromJson(json);
  Map<String, dynamic> toJson() => _$TokenUserToJson(this);

  @override
  List<Object> get props => [token, user.id];
}

@JsonSerializable()
class ChangePasswordResult extends Equatable {
  String detail;

  static ChangePasswordResult fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResultFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordResultToJson(this);

  @override
  List<Object> get props => [detail];
}
