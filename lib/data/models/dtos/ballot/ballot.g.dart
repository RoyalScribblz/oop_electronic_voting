// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ballot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ballot _$BallotFromJson(Map<String, dynamic> json) => Ballot(
      ballotId: json['ballotId'] as String,
      electionId: json['electionId'] as String,
      voterId: json['voterId'] as String,
      candidateId: json['candidateId'] as String,
    );

Map<String, dynamic> _$BallotToJson(Ballot instance) => <String, dynamic>{
      'ballotId': instance.ballotId,
      'electionId': instance.electionId,
      'voterId': instance.voterId,
      'candidateId': instance.candidateId,
    };
