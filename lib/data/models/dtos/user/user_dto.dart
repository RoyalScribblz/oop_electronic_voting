import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String userId;
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

  UserDto({
    required this.userId,
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

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}