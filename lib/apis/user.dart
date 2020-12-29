part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class User extends Equatable {
  int id;
  String username;
  String name;
  String first_name;
  String last_name;
  bool is_staff;
  bool is_active;
  bool is_superuser;
  String email;

  int role;
  Map<String, String> photo;

  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [
        id,
        username,
        first_name,
        last_name,
        is_staff,
        is_active,
        is_superuser,
        role,
        photo,
        email
      ];
}

@JsonSerializable()
class TokenUser {
  String token;
  User user;

  static TokenUser fromJson(Map<String, dynamic> json) =>
      _$TokenUserFromJson(json);
  Map<String, dynamic> toJson() => _$TokenUserToJson(this);

  @override
  List<Object> get props => [
        token,
      ];
}
