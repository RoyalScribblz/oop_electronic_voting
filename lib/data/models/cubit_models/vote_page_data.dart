import '../dtos/candidate/candidate_dto.dart';
import '../dtos/election/election_dto.dart';
import '../dtos/voter/voter_dto.dart';

class VotePageData {
  final ElectionDto election;
  final CandidateDto? selectedCandidate;
  final VoterDto voter;

  VotePageData(
    this.election,
    this.selectedCandidate,
    this.voter,
  );
}
