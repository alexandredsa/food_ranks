import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class FoodService {
  final String API_BASE_URL = "https://run.mocky.io/v3";

  bool validateResponse(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  List<String> decodeStringList(http.Response response) {
      var decoded = json.decode(response.body);
      return decoded.map();
  }
}