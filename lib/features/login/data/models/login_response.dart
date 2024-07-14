import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  @JsonKey(name: 'data')
  final UserData userData;
  final bool status;
  final int code;
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponse({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'username')
  final String userName;
  final String token;
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  UserData({required this.userName, required this.token});
}
