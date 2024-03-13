import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/dtos/user/user_dto.dart';

class UserRepository {
  static Future createUser(UserDto createRequest) async {
    final response = await http.post(
      Uri.http("localhost:5238", "user"),
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

  static Future<UserDto?> getUser(String? userId) async {
    if (userId == null) {
      return null;
    }

    final response = await http.get(
      Uri.http("localhost:5238", "user/$userId"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );

    if (response.statusCode == 200) {
      UserDto user = UserDto.fromJson(json.decode(response.body));
      return user;
    }

    return null;
  }
}
