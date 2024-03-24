import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oop_electronic_voting/data/repositories/contracts/ballot/create_ballot_request.dart';

import '../models/dtos/ballot/ballot_dto.dart';

class BallotRepository {
  static Future<BallotDto?> createBallot(
      CreateBallotRequest createRequest, Credentials? credentials) async {
    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    if (credentials != null) {
      headers['Authorization'] = 'Bearer ${credentials.accessToken}';
    }

    final response = await http.post(
      Uri.http("localhost:5238", "ballot"),
      headers: headers,
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode != 201) {
      return null;
    } else {
      return BallotDto.fromJson(json.decode(response.body));
    }
  }
}
