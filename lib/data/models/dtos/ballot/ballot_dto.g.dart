// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ballot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BallotDto _$BallotDtoFromJson(Map<String, dynamic> json) => BallotDto(
      ballotId: json['ballotId'] as String,
      electionId: json['electionId'] as String,
      userId: json['userId'] as String,
      candidateId: json['candidateId'] as String,
    );

Map<String, dynamic> _$BallotDtoToJson(BallotDto instance) => <String, dynamic>{
      'ballotId': instance.ballotId,
      'electionId': instance.electionId,
      'userId': instance.userId,
      'candidateId': instance.candidateId,
    };
