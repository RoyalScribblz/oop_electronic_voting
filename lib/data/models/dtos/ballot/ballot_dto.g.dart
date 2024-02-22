// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ballot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BallotDto _$BallotDtoFromJson(Map<String, dynamic> json) => BallotDto(
      ballotId: json['ballotId'] as String,
      electionId: json['electionId'] as String,
      voterId: json['voterId'] as String,
      candidateId: json['candidateId'] as String,
    );

Map<String, dynamic> _$BallotDtoToJson(BallotDto instance) => <String, dynamic>{
      'ballotId': instance.ballotId,
      'electionId': instance.electionId,
      'voterId': instance.voterId,
      'candidateId': instance.candidateId,
    };
