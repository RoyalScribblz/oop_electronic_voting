import 'package:json_annotation/json_annotation.dart';

part 'election.g.dart';

@JsonSerializable()
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

  factory Election.fromJson(Map<String, dynamic> json) => _$ElectionFromJson(json);

  Map<String, dynamic> toJson() => _$ElectionToJson(this);
}