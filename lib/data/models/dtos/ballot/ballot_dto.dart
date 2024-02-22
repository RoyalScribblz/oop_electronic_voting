import 'package:json_annotation/json_annotation.dart';

part 'ballot_dto.g.dart';

@JsonSerializable()
class BallotDto {
  final String ballotId;
  final String electionId;
  final String voterId;
  final String candidateId;

  BallotDto({
    required this.ballotId,
    required this.electionId,
    required this.voterId,
    required this.candidateId,
  });

  factory BallotDto.fromJson(Map<String, dynamic> json) => _$BallotDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BallotDtoToJson(this);
}