import 'package:auth0_flutter/auth0_flutter.dart';

import '../dtos/candidate/candidate_dto.dart';
import '../dtos/election/election_dto.dart';

class VotePageData {
  final ElectionDto election;
  final CandidateDto? selectedCandidate;
  final String userId;
  final Credentials? credentials;

  VotePageData(
    this.election,
    this.selectedCandidate,
    this.userId,
    this.credentials,
  );
}
