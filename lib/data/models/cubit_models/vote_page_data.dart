
import '../dtos/candidate/candidate_dto.dart';
import '../dtos/election/election_dto.dart';

class VotePageData {
  final ElectionDto election;
  final CandidateDto? selectedCandidate;

  VotePageData(
    this.election,
    this.selectedCandidate,
  );
}
