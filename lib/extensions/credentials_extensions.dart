import 'package:auth0_flutter/auth0_flutter.dart';

extension CredentialsExtensions on Credentials? {
  bool isAdmin() {
    if (this == null) {
      return false;
    }

    List<dynamic> roles = this!.user.customClaims?["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"] as List<dynamic>;

    return roles.contains("Admin");
  }
}