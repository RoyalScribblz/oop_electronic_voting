// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      candidateId: json['candidateId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      colour: json['colour'] as String,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'candidateId': instance.candidateId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'colour': instance.colour,
    };
