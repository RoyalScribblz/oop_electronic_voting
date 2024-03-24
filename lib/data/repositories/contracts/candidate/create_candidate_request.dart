import 'package:json_annotation/json_annotation.dart';

part 'create_candidate_request.g.dart';

@JsonSerializable()
class CreateCandidateRequest {
  final String name;
  final String imageUrl;
  final String colour;

  CreateCandidateRequest({
    required this.name,
    required this.imageUrl,
    required this.colour,
  });

  factory CreateCandidateRequest.fromJson(Map<String, dynamic> json) => _$CreateCandidateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCandidateRequestToJson(this);
}