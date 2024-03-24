import 'package:auth0_flutter/auth0_flutter.dart';

class CreateCandidate {
  final Credentials credentials;
  final String name;
  final String imageUrl;
  final String colour;

  CreateCandidate(
      this.credentials,
      this.name,
      this.imageUrl,
      this.colour,
      );
}
