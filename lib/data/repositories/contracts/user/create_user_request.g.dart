// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      nationalId: json['nationalId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      address: json['address'] as String,
      postcode: json['postcode'] as String,
      country: json['country'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'nationalId': instance.nationalId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'address': instance.address,
      'postcode': instance.postcode,
      'country': instance.country,
      'phoneNumber': instance.phoneNumber,
    };
