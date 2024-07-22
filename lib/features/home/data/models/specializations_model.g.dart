// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSpecializationsModel _$ResponseSpecializationsModelFromJson(
        Map<String, dynamic> json) =>
    ResponseSpecializationsModel(
      specializations: (json['data'] as List<dynamic>)
          .map((e) => SpecializationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseSpecializationsModelToJson(
        ResponseSpecializationsModel instance) =>
    <String, dynamic>{
      'data': instance.specializations,
    };

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationModelToJson(
        SpecializationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      degree: json['degree'] as String,
      price: (json['appoint_price'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'address': instance.address,
      'description': instance.description,
      'degree': instance.degree,
      'appoint_price': instance.price,
    };
