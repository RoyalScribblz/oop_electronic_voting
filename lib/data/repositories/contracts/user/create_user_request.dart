import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  final String nationalId;
  final String firstName;
  final String lastName;
  final String middleName;
  final DateTime dateOfBirth;
  final String address;
  final String postcode;
  final String country;
  final String phoneNumber;

  CreateUserRequest({
    required this.nationalId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.dateOfBirth,
    required this.address,
    required this.postcode,
    required this.country,
    required this.phoneNumber,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) => _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}