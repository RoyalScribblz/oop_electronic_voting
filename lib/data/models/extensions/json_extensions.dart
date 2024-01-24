import 'dart:convert';

import 'package:http/http.dart';

extension ToJson on Response {
  Map<String, dynamic> toJson() {
    return json.decode(body);
  }
}