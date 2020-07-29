import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class FoodService {
  final String API_BASE_URL = "http://192.168.15.17:8080/api";

  bool validateResponse(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  List<String> decodeStringList(http.Response response) {
      var decoded = json.decode(response.body);
      return decoded.map();
  }
}