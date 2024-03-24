// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_candidate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCandidateRequest _$CreateCandidateRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCandidateRequest(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      colour: json['colour'] as String,
    );

Map<String, dynamic> _$CreateCandidateRequestToJson(
        CreateCandidateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'colour': instance.colour,
    };
