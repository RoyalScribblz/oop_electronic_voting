// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'election_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectionDto _$ElectionDtoFromJson(Map<String, dynamic> json) => ElectionDto(
      electionId: json['electionId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      candidateIds: (json['candidateIds'] as List<dynamic>)
          .map((e) => CandidateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectionDtoToJson(ElectionDto instance) =>
    <String, dynamic>{
      'electionId': instance.electionId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'candidateIds': instance.candidateIds,
    };
