import 'package:flutter/material.dart';
import 'package:food_ranks/blocs/food_review_bloc.dart';
import 'package:food_ranks/blocs/food_summary_bloc.dart';
import 'package:food_ranks/models/food_summary.dart';

import '../reviews.dart';

class FoodSummaryViewBuilder {
      static Widget buildResults(FoodSummaryBloc bloc) {
        var foodSummaries = bloc.foodSummaries;
        bloc.list();
        return ListView.separated(
          itemCount: foodSummaries?.length ?? 0,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, index) {
            final summary = foodSummaries[index];
            return ListTile(
              title: Text(summary.name),
              leading: Icon(Icons.fastfood),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Reviews(foodSummary: summary,),
                  ),
                );
              },
            );
          },
        );
      }
}