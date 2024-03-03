import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/dtos/election/election_dto.dart';

class ElectionRepository {
  static Future<List<ElectionDto>> getElections() async {
    final response = await http.get(
      Uri.http("localhost:5238", "elections"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => ElectionDto.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    return [];
  }

  static Future<ElectionDto?> getElection(String electionId) async {
    final response = await http.get(
      Uri.http("localhost:5238", "election/$electionId"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );

    if (response.statusCode == 200) {
      return ElectionDto.fromJson(json.decode(response.body));
    }

    return null;
  }
}
