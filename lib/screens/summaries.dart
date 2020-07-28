import 'package:flutter/material.dart';
import 'package:food_ranks/blocs/food_summary_bloc.dart';
import 'package:food_ranks/screens/partials/food_summary_view_builder.dart';
import 'package:provider/provider.dart';

class Summaries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodSummaryBloc = Provider.of<FoodSummaryBloc>(context);
    return Scaffold(appBar: AppBar(title: Text("FoodRanks"),),body: Container(child: FoodSummaryViewBuilder.buildResults(foodSummaryBloc)));
  }
}
