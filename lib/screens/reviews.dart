import 'package:flutter/material.dart';
import 'package:food_ranks/blocs/food_review_bloc.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/screens/partials/food_review_view_builder.dart';
import 'package:food_ranks/screens/review_form.dart';
import 'package:provider/provider.dart';

class Reviews extends StatelessWidget {
  final FoodSummary foodSummary;

  Reviews({Key key, this.foodSummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodReviewBloc = Provider.of<FoodReviewBloc>(context);
    foodReviewBloc.list(this.foodSummary.id);
    return Scaffold(
      appBar: AppBar(title: Text("FoodRanks"),),
      body: Container(child: FoodReviewViewBuilder.buildResults(foodReviewBloc)),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewForm(foodSummary: foodSummary,),
            ),
          );
        }
        ,),
    );
  }
}
