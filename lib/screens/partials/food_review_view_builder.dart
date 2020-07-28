import 'package:flutter/material.dart';
import 'package:food_ranks/blocs/food_review_bloc.dart';
import 'package:food_ranks/blocs/food_summary_bloc.dart';
import 'package:food_ranks/models/food_review.dart';
import 'package:food_ranks/models/food_summary.dart';

class FoodReviewViewBuilder {
  static Widget buildCategoryNoteDisplay(double value, String display, {bool highlight = false}) {
    return Padding(padding: EdgeInsets.all(5),
        child: Column(
            children: <Widget>[
              Text(value.toStringAsFixed(2), style: TextStyle(fontSize: highlight ? 22 : 18, fontWeight: FontWeight.bold, color: !highlight? Colors.black54 : Colors.red)),
              Text(display, style: TextStyle(fontSize: 12, color: !highlight? Colors.black26 : Colors.redAccent),)
            ]
        )
    );
  }

  static Widget buildResults(FoodReviewBloc bloc) {
    var foodReviews = bloc.foodReviews;
    return ListView.separated(
      itemCount: foodReviews?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final review = foodReviews[index];
        return Card(
            elevation: 3,
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5), child: Text(review.name.toUpperCase(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildCategoryNoteDisplay(review.texture, "textura"),
                        buildCategoryNoteDisplay(review.sauce, "molho"),
                        buildCategoryNoteDisplay(review.flavor, "sabor"),
                        buildCategoryNoteDisplay(review.average, "total", highlight: true),
                      ],)

                  ],
                ),
              ],)

        );
      },
    );
  }
}