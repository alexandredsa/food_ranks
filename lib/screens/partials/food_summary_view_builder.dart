import 'package:flutter/material.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:provider/provider.dart';

import '../reviews.dart';

class FoodSummaryViewBuilder {
      static Widget buildResults(List<FoodSummary> foodSummaries) {
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
                    builder: (context) => Reviews(foodSummary: summary),
                  ),
                );
              },
            );
          },
        );
      }
}