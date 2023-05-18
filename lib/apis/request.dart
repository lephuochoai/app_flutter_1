const apiUrl = 'dummyjson.com';

Uri getUri(path) {
  return Uri.https(apiUrl, path);
}

class ResponseApi {
  bool success;
  var data;

  ResponseApi(this.success, this.data);
}
