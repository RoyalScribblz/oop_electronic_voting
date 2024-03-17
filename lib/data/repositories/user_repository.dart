import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
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

  static Future<UserDto?> getUser(Credentials credentials) async {
    final response = await http.get(
      Uri.http("localhost:5238", "user/${credentials.user.sub}"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${credentials.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      UserDto user = UserDto.fromJson(json.decode(response.body));
      return user;
    }

    return null;
  }
}
