// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_election_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateElectionRequest _$CreateElectionRequestFromJson(
        Map<String, dynamic> json) =>
    CreateElectionRequest(
      name: json['name'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      candidateIds: (json['candidateIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateElectionRequestToJson(
        CreateElectionRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'candidateIds': instance.candidateIds,
    };
