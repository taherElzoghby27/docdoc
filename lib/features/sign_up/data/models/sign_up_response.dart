import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String message;
  @JsonKey(name: 'data')
  final UserData userData;
  final bool status;
  final int code;
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  SignUpResponse({
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
