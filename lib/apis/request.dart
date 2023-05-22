import 'package:http/http.dart' as http;

const apiUrl = 'localhost:8080';

Uri getUri(path, {params}) {
  return Uri.http(apiUrl, path, params);
}

class ResponseApi {
  bool success;
  var data;

  ResponseApi(this.success, this.data);
}

class RequestApi {
  // String method = '';
  // final data;
  // final params;

  // RequestApi({
  //   required this.method,
  //   this.params,
  //   this.data
  // });

  static get(String url, params) {
    http.get(getUri(url, params: params));
  }

  static post(url, payload) {
    http.post(getUri('/auth/login'), body: payload);
  }
}
