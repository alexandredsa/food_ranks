import 'package:flutter/material.dart';
import 'package:food_ranks/blocs/food_review_bloc.dart';
import 'package:food_ranks/blocs/food_summary_bloc.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/screens/summaries.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodSummaryBloc>(create: (context) => FoodSummaryBloc()),
        ChangeNotifierProvider<FoodReviewBloc>(create: (context) => FoodReviewBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodRanks',
        theme: ThemeData(
          fontFamily: 'Ubuntu',
        ),
        home: Summaries(),
      ),
    );
  }
}