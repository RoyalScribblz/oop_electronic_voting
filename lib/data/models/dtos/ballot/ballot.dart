import 'package:json_annotation/json_annotation.dart';

part 'ballot.g.dart';

@JsonSerializable()
class Ballot {
  final String ballotId;
  final String electionId;
  final String voterId;
  final String candidateId;

  Ballot({
    required this.ballotId,
    required this.electionId,
    required this.voterId,
    required this.candidateId,
  });

  factory Ballot.fromJson(Map<String, dynamic> json) => _$BallotFromJson(json);

  Map<String, dynamic> toJson() => _$BallotToJson(this);
}