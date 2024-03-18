import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oop_electronic_voting/data/repositories/contracts/user/create_user_request.dart';

import '../models/dtos/user/user_dto.dart';

class UserRepository {
  static Future<UserDto> createUser(CreateUserRequest createRequest, Credentials credentials) async {
    final response = await http.post(
      Uri.http("localhost:5238", "user"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${credentials.accessToken}'
      },
      body: jsonEncode(createRequest.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create new user");
    }

    return UserDto.fromJson(json.decode(response.body));
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
