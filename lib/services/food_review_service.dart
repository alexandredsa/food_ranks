import 'dart:convert';

import 'package:food_ranks/models/food_review.dart';
import 'package:food_ranks/services/food_service.dart';
import 'package:http/http.dart' as http;

class FoodReviewService extends FoodService {

    Future<List<FoodReview>> list(String id) async {
        http.Response response = await http.get(
            "$API_BASE_URL/types/${id}/reviews"
        );

        return decodeEntity(response);

    }

    void delete(String summaryId, FoodReview foodReview) async {
        await http.delete(
            "$API_BASE_URL/types/${summaryId}/reviews/${foodReview.id}"
        );
    }


    Future add(String foodTypeId, FoodReview review) async {
        await http.post(
            "$API_BASE_URL/types/${foodTypeId}/reviews/",
            headers: {
                "Content-Type": "application/json"
            },
            body: json.encode(review.toJson()),
        );
    }

    List<FoodReview> decodeEntity(http.Response response) {
        if(!this.validateResponse(response)) {
            throw Exception("Failed to load summaries");
        }

        try {
            var decoded = json.decode(response.body);
            List<FoodReview> summaries = decoded.map<FoodReview>(
                    (map) {
                    return FoodReview.fromJson(map);
                }
            ).toList();

            return summaries;
        }   catch(e) {
            return List<FoodReview>();
        }
    }

}