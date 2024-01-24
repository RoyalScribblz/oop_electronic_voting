class Election {
  final String electionId;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> candidateIds;

  Election({
    required this.electionId,
    required this.startTime,
    required this.endTime,
    required this.candidateIds,
  });
}