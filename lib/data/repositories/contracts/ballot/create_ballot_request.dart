import 'package:json_annotation/json_annotation.dart';

part 'create_ballot_request.g.dart';

@JsonSerializable()
class CreateBallotRequest {
  final String electionId;
  final String userId;
  final String candidateId;

  CreateBallotRequest({
    required this.electionId,
    required this.userId,
    required this.candidateId,
  });

  factory CreateBallotRequest.fromJson(Map<String, dynamic> json) => _$CreateBallotRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBallotRequestToJson(this);
}