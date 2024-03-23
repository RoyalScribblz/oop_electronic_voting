import 'package:json_annotation/json_annotation.dart';

part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  final String candidateId;
  final String name;
  final String imageUrl;
  final String colour;

  Candidate({
    required this.candidateId,
    required this.name,
    required this.imageUrl,
    required this.colour,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}