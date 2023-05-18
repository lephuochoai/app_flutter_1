import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'request.dart';

class AuthApis {
  static Future<ResponseApi> login(String username, String password) async {
    final response = await http.post(getUri('/auth/login'),
        body: {'username': username, 'password': password});
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return ResponseApi(true, jsonResponse);
    } else {
      return ResponseApi(false, jsonResponse);
    }
  }
}
