import 'package:http/http.dart' as http;

class BaseHttpClient {
  static const int TIME_OUT_DURATION = 20;
  String BASE_URL = "jsonplaceholder.typicode.com";

  Future<http.Response> get({required String api, dynamic query}) async {
    var uri = Uri.https(BASE_URL, api, query);
    try {
      var response = await http
          .get(uri)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on Exception {
      throw Exception(["Something went wrong"]);
    }
  }
}
