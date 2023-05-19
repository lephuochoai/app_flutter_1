import 'dart:convert';
import 'package:http/http.dart' as http;

import 'request.dart';

class AuthApis {
  static Future<ResponseApi> login(String username, String password) async {
    final response = await http.post(getUri('/auth/login'),
        body: {'username': username, 'password': password});
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ResponseApi(true, jsonResponse);
    } else {
      return ResponseApi(false, jsonResponse);
    }
  }

  static Future<ResponseApi> register(String email, String password) async {
    final response = await http.post(getUri('/auth/register'),
        body: {'email': email, 'password': password});
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ResponseApi(true, data);
    } else {
      return ResponseApi(false, data);
    }
  }
}
