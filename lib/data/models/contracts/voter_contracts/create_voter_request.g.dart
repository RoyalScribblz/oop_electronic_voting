// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_voter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVoterRequest _$CreateVoterRequestFromJson(Map<String, dynamic> json) =>
    CreateVoterRequest(
      nationalId: json['nationalId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      address: json['address'] as String,
      postcode: json['postcode'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      passwordHash: json['passwordHash'] as String,
    );

Map<String, dynamic> _$CreateVoterRequestToJson(CreateVoterRequest instance) =>
    <String, dynamic>{
      'nationalId': instance.nationalId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'address': instance.address,
      'postcode': instance.postcode,
      'country': instance.country,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'passwordHash': instance.passwordHash,
    };
