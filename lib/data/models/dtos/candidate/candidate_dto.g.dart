// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateDto _$CandidateDtoFromJson(Map<String, dynamic> json) => CandidateDto(
      candidateId: json['candidateId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      colour: json['colour'] as String,
    );

Map<String, dynamic> _$CandidateDtoToJson(CandidateDto instance) =>
    <String, dynamic>{
      'candidateId': instance.candidateId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'colour': instance.colour,
    };
