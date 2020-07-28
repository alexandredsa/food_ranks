import 'package:flutter/cupertino.dart';
import 'package:food_ranks/models/food_review.dart';
import 'package:food_ranks/services/food_review_service.dart';

class FoodReviewBloc extends ChangeNotifier {
  var _foodReviews = new List<FoodReview>();
  var _service = FoodReviewService();

  List<FoodReview> get foodReviews => _foodReviews;

  void list(String id) async {
    _foodReviews = await _service.list(id);
    notifyListeners();
  }

  void add(String foodTypeId, FoodReview foodReview) async {
    _foodReviews = await _service.add(foodTypeId, foodReview);
  }
}