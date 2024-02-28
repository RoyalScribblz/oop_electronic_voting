// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ballot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBallotRequest _$CreateBallotRequestFromJson(Map<String, dynamic> json) =>
    CreateBallotRequest(
      electionId: json['electionId'] as String,
      voterId: json['voterId'] as String,
      candidateId: json['candidateId'] as String,
    );

Map<String, dynamic> _$CreateBallotRequestToJson(
        CreateBallotRequest instance) =>
    <String, dynamic>{
      'electionId': instance.electionId,
      'voterId': instance.voterId,
      'candidateId': instance.candidateId,
    };
