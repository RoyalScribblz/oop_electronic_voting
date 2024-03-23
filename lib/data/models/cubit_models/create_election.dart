import 'package:auth0_flutter/auth0_flutter.dart';

import '../../repositories/contracts/candidate/candidate.dart';

class CreateElection {
  final Credentials credentials;
  final String name;
  final String startTime;
  final String endTime;
  final Map<Candidate, bool> candidates;

  CreateElection(
    this.credentials,
    this.name,
    this.startTime,
    this.endTime,
    this.candidates,
  );
}
