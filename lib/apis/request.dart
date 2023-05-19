const apiUrl = 'localhost:8080';

Uri getUri(path) {
  return Uri.http(apiUrl, path);
}

class ResponseApi {
  bool success;
  var data;

  ResponseApi(this.success, this.data);
}
