import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/extensions/json_extensions.dart';
import '../models/dtos/voter/voter.dart';

class VoterRepository {
  static Future createVoter(Voter createRequest) async {
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

  static Future<Voter?> getVoter(String? voterId) async {
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
      Voter voter = Voter.fromJson(response.toJson());
      return voter;
    }

    return null;
  }
}
