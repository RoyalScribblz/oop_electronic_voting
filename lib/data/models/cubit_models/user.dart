import 'package:auth0_flutter/auth0_flutter.dart';

import '../dtos/user/user_dto.dart';


class Identity {
  final Credentials? credentials;
  final UserDto? user;

  Identity(
    this.credentials,
    this.user,
  );
}
