import 'dart:convert';

import 'package:food_ranks/models/food_review.dart';
import 'package:food_ranks/services/food_service.dart';
import 'package:http/http.dart' as http;

class FoodReviewService extends FoodService {

    Future<List<FoodReview>> list(String id) async {
        http.Response response = await http.get(
            "$API_BASE_URL/598fa4a3-9b6f-4f25-94b5-f8d2fbfd137a"
        );

        return decodeEntity(response);

    }

    Future add(String foodTypeId, FoodReview review) async {
        http.Response response = await http.post(
            "$API_BASE_URL/598fa4a3-9b6f-4f25-94b5-f8d2fbfd137a",
            headers: {"Content-Type": "application/json"},
            body: json.encode(review),
        );

        return decodeEntity(response);

    }

    List<FoodReview> decodeEntity(http.Response response) {
        if(!this.validateResponse(response)) {
            throw Exception("Failed to load summaries");
        }

        var decoded = json.decode(response.body);

        List<FoodReview> summaries = decoded.map<FoodReview>(
                (map){
                return FoodReview.fromJson(map);
            }
        ).toList();

        return summaries;

    }
}