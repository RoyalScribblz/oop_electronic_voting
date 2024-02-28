// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'election_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectionDto _$ElectionDtoFromJson(Map<String, dynamic> json) => ElectionDto(
      electionId: json['electionId'] as String,
      name: json['name'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => CandidateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectionDtoToJson(ElectionDto instance) =>
    <String, dynamic>{
      'electionId': instance.electionId,
      'name': instance.name,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'candidates': instance.candidates,
    };
