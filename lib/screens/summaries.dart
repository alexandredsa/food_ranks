import 'package:flutter/material.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/screens/partials/food_summary_view_builder.dart';
import 'package:food_ranks/services/food_summary_service.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class Summaries extends StatefulWidget {

  @override
  SummariesState createState() {
    return SummariesState(FoodSummaryService());
  }
}

class SummariesState extends State<Summaries> {
  final FoodSummaryService foodSummaryService;

  SummariesState(this.foodSummaryService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent,title: Text("FoodRanks"),),
      body: Container(child: FutureBuilder(
          future: foodSummaryService.list(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return FoodSummaryViewBuilder.buildResults(snapshot.data);
            } else{
              return Center(
                child: Loading(indicator: BallPulseIndicator(), size: 80.0,color: Colors.pink),
              );
            }
          }
      ),
      ),
    );
  }
}