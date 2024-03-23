import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oop_electronic_voting/data/repositories/contracts/election/create_election_request.dart';

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

  static Future createElection(CreateElectionRequest createRequest, Credentials credentials) async {
    final response = await http.post(
      Uri.http("localhost:5238", "election"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${credentials.accessToken}'
      },
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create new election");
    }
  }
}
