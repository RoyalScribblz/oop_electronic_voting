import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/extensions/json_extensions.dart';
import '../models/contracts/voter_contracts/create_voter_request.dart';
import '../models/dtos/voter/voter.dart';

class VoterRepository {
  static Future<Voter> createVoter(CreateVoterRequest createRequest) async {
    final response = await http.post(
      Uri.http("localhost:5238", "voters"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode == 201) {
      Voter voter = Voter.fromJson(response.toJson());
      return voter;
    } else {
      throw Exception();
    }
  }
}
