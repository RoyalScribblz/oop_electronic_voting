import 'package:json_annotation/json_annotation.dart';
import 'package:oop_electronic_voting/data/models/dtos/candidate/candidate_dto.dart';

part 'election_dto.g.dart';

@JsonSerializable()
class ElectionDto {
  final String electionId;
  final DateTime startTime;
  final DateTime endTime;
  final List<CandidateDto> candidateIds;

  ElectionDto({
    required this.electionId,
    required this.startTime,
    required this.endTime,
    required this.candidateIds,
  });

  factory ElectionDto.fromJson(Map<String, dynamic> json) => _$ElectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ElectionDtoToJson(this);
}