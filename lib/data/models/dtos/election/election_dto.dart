import 'package:json_annotation/json_annotation.dart';
import 'package:oop_electronic_voting/data/models/dtos/candidate/candidate_dto.dart';

part 'election_dto.g.dart';

@JsonSerializable()
class ElectionDto {
  final String electionId;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final List<CandidateDto> candidates;

  ElectionDto({
    required this.electionId,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.candidates,
  });

  factory ElectionDto.fromJson(Map<String, dynamic> json) => _$ElectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ElectionDtoToJson(this);
}