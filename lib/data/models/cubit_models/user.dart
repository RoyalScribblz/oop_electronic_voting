import 'package:auth0_flutter/auth0_flutter.dart';

import '../dtos/voter/voter_dto.dart';

class User {
  final Credentials? credentials;
  final VoterDto? voter;

  User(
    this.credentials,
    this.voter,
  );
}
