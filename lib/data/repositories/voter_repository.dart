import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/dtos/voter/voter_dto.dart';

class VoterRepository {
  static Future createVoter(VoterDto createRequest) async {
    final response = await http.post(
      Uri.http("localhost:5238", "voter"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception();
    }
  }

  static Future<VoterDto?> getVoter(String? voterId) async {
    if (voterId == null) {
      return null;
    }

    final response = await http.get(
      Uri.http("localhost:5238", "voter/$voterId"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );

    if (response.statusCode == 200) {
      VoterDto voter = VoterDto.fromJson(json.decode(response.body));
      return voter;
    }

    return null;
  }
}
