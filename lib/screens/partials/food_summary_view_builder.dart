import 'package:flutter/material.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

import '../reviews.dart';

class FoodSummaryViewBuilder {
  static Widget buildResults(BuildContext context, List<FoodSummary> foodSummaries) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: foodSummaries.map((summary) {
        return buildItem(context, summary);
      }).toList(),
    );
  }

  static Widget buildItem(BuildContext context, FoodSummary summary) {
    return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Reviews(foodSummary: summary,))),
        child: Card(
            color: Colors.amberAccent,
            elevation: 3,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Image.network(summary.iconUrl ?? FoodSummary.DEFAULT_IMAGE_URL, width: 118, loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Loading(indicator: BallBeatIndicator(), size: 80.0,color: Colors.pink);
                },
                ),
                Text(summary.name.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            )

        )
    );
  }
}