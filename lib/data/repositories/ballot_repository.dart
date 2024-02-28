import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oop_electronic_voting/data/repositories/contracts/ballot/create_ballot_request.dart';

import '../models/dtos/ballot/ballot_dto.dart';

class BallotRepository {
  static Future<BallotDto> createBallot(CreateBallotRequest createRequest) async {
    final response = await http.post(
      Uri.http("localhost:5238", "ballot"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception();
    } else {
      return BallotDto.fromJson(json.decode(response.body));
    }
  }
}
