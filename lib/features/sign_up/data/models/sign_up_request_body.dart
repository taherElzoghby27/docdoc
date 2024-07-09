import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmationPassword;
  final String gender;
  final String phone;

  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
    required this.gender,
    required this.phone,
  });
  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
