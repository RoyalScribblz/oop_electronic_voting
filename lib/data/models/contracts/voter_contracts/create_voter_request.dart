import 'package:json_annotation/json_annotation.dart';

part 'create_voter_request.g.dart';

@JsonSerializable()
class CreateVoterRequest {
  final String nationalId;
  final String firstName;
  final String lastName;
  final String middleName;
  final DateTime dateOfBirth;
  final String address;
  final String postcode;
  final String country;
  final String email;
  final String phoneNumber;
  final String passwordHash;

  CreateVoterRequest({
    required this.nationalId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.dateOfBirth,
    required this.address,
    required this.postcode,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.passwordHash,
  });

  factory CreateVoterRequest.fromJson(Map<String, dynamic> json) => _$CreateVoterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateVoterRequestToJson(this);
}