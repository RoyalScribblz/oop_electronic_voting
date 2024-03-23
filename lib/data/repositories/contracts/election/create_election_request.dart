import 'package:json_annotation/json_annotation.dart';

part 'create_election_request.g.dart';

@JsonSerializable()
class CreateElectionRequest {
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> candidateIds;

  CreateElectionRequest({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.candidateIds,
  });

  factory CreateElectionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateElectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateElectionRequestToJson(this);
}
