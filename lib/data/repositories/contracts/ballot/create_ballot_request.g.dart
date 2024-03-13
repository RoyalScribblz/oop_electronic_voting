// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ballot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBallotRequest _$CreateBallotRequestFromJson(Map<String, dynamic> json) =>
    CreateBallotRequest(
      electionId: json['electionId'] as String,
      userId: json['userId'] as String,
      candidateId: json['candidateId'] as String,
    );

Map<String, dynamic> _$CreateBallotRequestToJson(
        CreateBallotRequest instance) =>
    <String, dynamic>{
      'electionId': instance.electionId,
      'userId': instance.userId,
      'candidateId': instance.candidateId,
    };
