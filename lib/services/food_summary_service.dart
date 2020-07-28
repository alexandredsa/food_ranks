import 'dart:convert';

import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/services/food_service.dart';
import 'package:http/http.dart' as http;
class FoodSummaryService extends FoodService {

    Future<List<FoodSummary>> list() async {
        http.Response response = await http.get(
            "$API_BASE_URL/34a039aa-441d-4d32-9c20-39db1cc0a292"
        );

        return decodeEntity(response);

    }

    Future<List<String>> suggest(String term) async {
        http.Response response = await http.post(
            "$API_BASE_URL", body: {'term': term}
        );

        return decodeStringList(response);

    }


    List<FoodSummary> decodeEntity(http.Response response) {
        if(!this.validateResponse(response)) {
            throw Exception("Failed to load summaries");
        }

        var decoded = json.decode(response.body);

        List<FoodSummary> summaries = decoded.map<FoodSummary>(
                (map){
                return FoodSummary.fromJson(map);
            }
        ).toList();

        return summaries;

    }
}