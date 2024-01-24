class Voter {
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
  final String passwordHash;

  Voter({
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
    required this.passwordHash,
  });
}