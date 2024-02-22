import 'package:json_annotation/json_annotation.dart';

part 'voter_dto.g.dart';

@JsonSerializable()
class VoterDto {
  final String voterId;
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

  VoterDto({
    required this.voterId,
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
  });

  factory VoterDto.fromJson(Map<String, dynamic> json) => _$VoterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VoterDtoToJson(this);
}