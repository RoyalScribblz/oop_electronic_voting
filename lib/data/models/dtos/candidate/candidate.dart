import 'package:json_annotation/json_annotation.dart';

part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  final String candidateId;
  final String name;
  final String imageUrl;

  Candidate({
    required this.candidateId,
    required this.name,
    required this.imageUrl,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}