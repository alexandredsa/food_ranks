import 'package:flutter/material.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/screens/partials/food_review_view_builder.dart';
import 'package:food_ranks/screens/review_form.dart';
import 'package:food_ranks/services/food_review_service.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class Reviews extends StatefulWidget {
  final FoodSummary foodSummary;

  const Reviews({Key key, this.foodSummary}) : super(key: key);


  @override
  ReviewsState createState() {
    return ReviewsState(this.foodSummary, FoodReviewService());
  }
}

class ReviewsState extends State<Reviews> {
  final FoodSummary foodSummary;
  final FoodReviewService foodReviewService;
  ReviewsState(this.foodSummary, this.foodReviewService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text(foodSummary.name.toUpperCase()), Image.network(foodSummary.iconUrl, height: 48,)]), backgroundColor: Colors.redAccent,),
      body: Container(child: FutureBuilder(
          future: foodReviewService.list(foodSummary.id),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return FoodReviewViewBuilder((direction, foodReview) => this.foodReviewService.delete(foodSummary.id, foodReview)).buildResults(snapshot.data);
            } else{
              return Center(
                child: Loading(indicator: BallPulseIndicator(), size: 80.0,color: Colors.pink),
              );
            }
          }
      ),
      ),
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
