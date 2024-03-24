import 'dart:convert';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:http/http.dart' as http;

import 'contracts/candidate/candidate.dart';
import 'contracts/candidate/create_candidate_request.dart';

class CandidateRepository {
  static Future<List<Candidate>> getCandidates() async {
    final response = await http.get(
      Uri.http("localhost:5238", "candidates"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((c) => Candidate.fromJson(Map<String, dynamic>.from(c)))
          .toList();
    }

    return [];
  }

  static Future createCandidate(CreateCandidateRequest createRequest, Credentials credentials) async {
    final response = await http.post(
      Uri.http("localhost:5238", "candidate"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${credentials.accessToken}'
      },
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create new candidate");
    }
  }
}