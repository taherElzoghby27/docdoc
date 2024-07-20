import 'package:freezed_annotation/freezed_annotation.dart';

part 'specializations_model.g.dart';

@JsonSerializable()
class ResponseSpecializationsModel {
  @JsonKey(name: 'data')
  final List<SpecializationModel> specializations;

  ResponseSpecializationsModel({required this.specializations});
  factory ResponseSpecializationsModel.fromJson(Map<String, dynamic> dataMap) =>
      _$ResponseSpecializationsModelFromJson(dataMap);
}

@JsonSerializable()
class SpecializationModel {
  final int id;
  final String name;
  final List<DoctorModel> doctors;

  SpecializationModel({
    required this.id,
    required this.name,
    required this.doctors,
  });
  factory SpecializationModel.fromJson(Map<String, dynamic> dataMap) =>
      _$SpecializationModelFromJson(dataMap);
}

@JsonSerializable()
class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  @JsonKey(name: 'appoint_price')
  final int price;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.price,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> dataMap) =>
      _$DoctorModelFromJson(dataMap);
}
