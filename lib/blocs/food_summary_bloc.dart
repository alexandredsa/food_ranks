import 'package:flutter/cupertino.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/services/food_summary_service.dart';

class FoodSummaryBloc extends ChangeNotifier {
  var _foodSummaries = new List<FoodSummary>();
  var _service = FoodSummaryService();

  List<FoodSummary> get foodSummaries => _foodSummaries;

  list() async {
    _foodSummaries = await _service.list();
    notifyListeners();
  }
}