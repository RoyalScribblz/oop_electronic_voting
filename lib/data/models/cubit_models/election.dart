import 'candidate.dart';

class Election {
  final String electionId;
  final DateTime startTime;
  final DateTime endTime;
  final List<Candidate> candidates;

  Election(
    this.electionId,
    this.startTime,
    this.endTime,
    this.candidates,
  );
}