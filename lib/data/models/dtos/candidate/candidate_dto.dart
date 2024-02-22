import 'package:json_annotation/json_annotation.dart';

part 'candidate_dto.g.dart';

@JsonSerializable()
class CandidateDto {
  final String candidateId;
  final String name;
  final String imageUrl;

  CandidateDto({
    required this.candidateId,
    required this.name,
    required this.imageUrl,
  });

  factory CandidateDto.fromJson(Map<String, dynamic> json) => _$CandidateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateDtoToJson(this);
}