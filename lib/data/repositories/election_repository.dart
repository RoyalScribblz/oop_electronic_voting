import 'package:http/http.dart' as http;

import '../models/dtos/election/election_dto.dart';
import '../models/extensions/json_extensions.dart';

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
      return (response.toJson() as List)
          .map((i) => ElectionDto.fromJson(i))
          .toList();
    }

    return [];
  }
}
