import 'dart:convert';
import 'package:http/http.dart' as http;

import 'contracts/candidate/candidate.dart';

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
}